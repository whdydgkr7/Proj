package com.kosmo.volume;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import kakao.kakao_restapi;
import naver.JsonParser;
import naver.NaverLoginBO;
import user.UserDTO;
import user.UserImpl;

@Controller
public class LoginController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/login")
	public String login(Model model) {
		return "login/login";
	}
	
	@RequestMapping("/loginAction")
	public ModelAndView loginAction(Model model, HttpServletRequest req, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		UserDTO usersDTO=sqlSession.getMapper(UserImpl.class).login(req.getParameter("id"), req.getParameter("pass"));

		if (usersDTO==null) {
			mv.addObject("loginCheck", "false");
			mv.setViewName("login/login");
			return mv;
		}
		else {
			mv.addObject("loginCheck", "true");
			session.setAttribute("login", usersDTO);
		}
		
		//로그인 후 페이지 이동
		String backUrl=req.getParameter("backUrl");
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping("/register")
	public String register(Model model) {
		return "login/register";
	}
	
	@RequestMapping("/registerAction")
	public ModelAndView regiUserAction(Model model, HttpServletRequest req, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		
		UserDTO dto=new UserDTO();
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("pass"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		dto.setAuthority("USER");
		dto.setUserType("user");
				
		sqlSession.getMapper(UserImpl.class).regiUser(dto);
		session.setAttribute("login", dto);
		
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(HttpServletRequest req) {
		
		String result="";
		int idOverlap=sqlSession.getMapper(UserImpl.class).idCheck(req.getParameter("id"));
		System.out.println("idOverlap:"+idOverlap);
		if(idOverlap == 0) result="true";
		else  result="false";
		
		return result;
	}
	
	
	//------------------------------------- 소셜 로그인      ----------------------------------------
	
	NaverLoginBO naverLoginBO=new NaverLoginBO();
	
	@RequestMapping(value = "/naverLogin", method = RequestMethod.GET)
	public ModelAndView naverLogin(HttpSession session) {
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		return new ModelAndView("login/naverLogin", "url", naverAuthUrl);
	}

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model, UserDTO userDTO) throws Exception {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */

		JsonParser json = new JsonParser();

		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		userDTO = json.changeJson(apiResult); // dto에 userEmail저장
		System.out.println("User Uid : " + userDTO.getEmail().substring(0, userDTO.getEmail().indexOf("@")));
        System.out.println("User Name : " + userDTO.getName());
        System.out.println("User Email : " + userDTO.getEmail());
				
		//sqlSession.getMapper(UserImpl.class).regiUser(userDTO);
		session.setAttribute("login", inputSocialUser(userDTO.getEmail().substring(0, userDTO.getEmail().indexOf("@")), userDTO.getName(), userDTO.getEmail(), "naver"));

		return "login/callback";
	}
    
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
 
    private org.springframework.social.oauth2.OAuth2Operations oauthOperations;
 
    // 회원 가입 페이지
    @RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String join(HttpServletResponse response, Model model) {
 
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        String url = ((org.springframework.social.oauth2.OAuth2Operations) oauthOperations).buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        System.out.println("/googleLogin, url : " + url);
        model.addAttribute("google_url", url);
 
        return "login/googleLogin";
    }
 
 
    // ------------------------------------ 구글 콜백 ----------------------------------------
    
    @RequestMapping(value = "/googleSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String doSessionAssignActionPage(HttpServletRequest request, HttpSession session) throws Exception {
 
        String code = request.getParameter("code");
 
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
                null);
 
        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
 
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
 
        }
 
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
        System.out.println(connection);
 
        PlusOperations plusOperations = google.plusOperations();
        Person profile = plusOperations.getGoogleProfile();
        System.out.println("User Uid : " + profile.getId());
        System.out.println("User Name : " + profile.getDisplayName());
        System.out.println("User Email : " + profile.getAccountEmail());
        System.out.println("User Profile : " + profile.getImageUrl());
 

        
       /* UserDTO userDTO=new UserDTO();
        userDTO.setId(profile.getId());
        userDTO.setName(profile.getDisplayName());
        userDTO.setEmail(profile.getAccountEmail());
        userDTO.setPass(profile.getAccountEmail());
        userDTO.setUserType("google");
        sqlSession.getMapper(UserImpl.class).regiUser(userDTO);*/
        String id=profile.getAccountEmail().substring(0,profile.getAccountEmail().indexOf("@"));
        session.setAttribute("login",  inputSocialUser(id, id,profile.getAccountEmail(), "google"));
        
        // Access Token 취소
        try {
            System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
 
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
        } catch (Exception e) {
 
            e.printStackTrace();
        }
        return "redirect:/";
 
    }
    
    
    //카카오 로그인 로그아웃
    private kakao_restapi kakao_restapi = new kakao_restapi();
    
/*    @RequestMapping(value = "/oauth", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
    public String kakaoLogin(@RequestParam("code") String code) {
        System.out.println(code);//access_token
        return "home";
    }*/
    
    @RequestMapping(value = "/oauth", produces = "application/json")
    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
        System.out.println("로그인 할때 임시 코드값");
        //카카오 홈페이지에서 받은 결과 코드
        System.out.println(code);
        System.out.println("로그인 후 결과값");
        
        //카카오 rest api 객체 선언
        kakao_restapi kr = new kakao_restapi();
        //결과값을 node에 담아줌
        JsonNode node = kr.getAccessToken(code);
        //결과값 출력
        System.out.println(node);
        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
        String token = node.get("access_token").toString();
        //세션에 담아준다.
        session.setAttribute("token", token);
        
        // access_token을 통해 사용자 정보 요청
        JsonNode userInfo = kakao_restapi.getKakaoUserInfo(node.get("access_token"));
 
        // Get id
        String id = userInfo.path("id").asText();
        String name = null;
        String email = null;
 
        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        name = properties.path("nickname").asText();
        email = kakao_account.path("email").asText();
 
        System.out.println("id : " + id);
        System.out.println("name : " + name);
        System.out.println("email : " + email);
        
        session.setAttribute("login",  inputSocialUser(email.substring(0, email.indexOf("@")),name,email,"kakao"));
        
        return "redirect:/";
    }
    
    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) {
    	session.removeAttribute("login");
    	model.addAttribute("logoutMsg", " ");
    	
    	return "redirect:/";
    }
    /*@RequestMapping(value = "/logout", produces = "application/json")
    public String Logout(HttpSession session) {
        //kakao restapi 객체 선언
        kakao_restapi kr = new kakao_restapi();
        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
        JsonNode node = kr.Logout(session.getAttribute("token").toString());
        //결과 값 출력
        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
        return "redirect:/";
    }*/
    
    public UserDTO inputSocialUser(String id, String name, String email, String userType) {
        UserDTO userDTO=new UserDTO();
        if(sqlSession.getMapper(UserImpl.class).idCheck(id)==0) {
            userDTO.setId(id);
            userDTO.setName(name);
            userDTO.setEmail(email);
            userDTO.setPass(email);
            userDTO.setAuthority("USER");
            userDTO.setUserType(userType);
    		sqlSession.getMapper(UserImpl.class).regiUser(userDTO);
        }
        else userDTO=sqlSession.getMapper(UserImpl.class).getUser(id);
        
        return userDTO;
    }
}
