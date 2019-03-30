package com.kosmo.volume;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
import user.Temp;
import user.UserDTO;
import user.UserImpl;

@Controller
public class LoginController {

   @Autowired
   private SqlSession sqlSession;
   @Autowired
    private JavaMailSenderImpl mailSender;

   @RequestMapping("/login")
   public String login(Model model) {
      return "login/login";
   }

   @RequestMapping("/loginAction")
   public ModelAndView loginAction(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      
      UserDTO usersDTO = sqlSession.getMapper(UserImpl.class).login(req.getParameter("id"), req.getParameter("pass"));
      int auth= sqlSession.getMapper(UserImpl.class).isAuth(req.getParameter("id"));
      
      
      
      if(auth == 0) {
         mv.addObject("auth",auth);
         mv.addObject("loginCheck", "false");
         mv.setViewName("home");
      }
      else {
         if (usersDTO == null) {
            mv.addObject("loginCheck", "false");
            mv.addObject("auth", auth);
            mv.setViewName("login/login");
         } else {
            mv.addObject("loginCheck", "true");
            mv.addObject("auth", auth);
            session.setAttribute("login", usersDTO);
            mv.setViewName("home");
         }
      }

      return mv;
   }
   //���̵� ���ã��
   //���̵� ã�� ��
     @RequestMapping(value = "/findId")
     public String find_id_form() throws Exception{
        
        return "idpassFind/find_id_form";
        
        
     }
     
     // ���̵� ã��
     @RequestMapping(value = "/idFind.do", method = RequestMethod.POST)
     @ResponseBody
     public String userIdSearch(@RequestParam("user_name") String  user_name, 
           @RequestParam("user_email") String user_email) {
        System.out.println(user_name);
        System.out.println(user_email);
        
        String result = sqlSession.getMapper(UserImpl.class).findId(user_name, user_email);  //searchService.userIdSearch(user_name, user_email);
       System.out.println("user_name="+user_name);
        System.out.println("user_email="+user_email);
        return result;
     }
     
   //��� ã�� ��
      @RequestMapping(value = "/findPass")
      public String find_pass_form() throws Exception{
         
         return "idpassFind/find_Pass_form";
         
         
      }
     
     //��й�ȣ ã��
     @RequestMapping(value = "/passFind.do")
     @ResponseBody
     public String userpassSearch(@RequestParam("user_email") String user_email) {
       
        
       /*String result = sqlSession.getMapper(UserImpl.class).findPass(user_email);  //searchService.userIdSearch(user_name, user_email);
       System.out.println("user_email="+user_email);*/
       String randomStr = randomStrInit();
       
     //임시패스워드로 회원정보 업데이트
       int updateResult = sqlSession.getMapper(UserImpl.class).randomPassUpdate(user_email, randomStr); 
       
     //이메일 발송
   	   String sendResult = EmailSend(user_email, randomStr);
       
        return sendResult;
        
     }
     
    // 이메일 난수 만드는 메서드
     private boolean lowerCheck = true;
     private int size = 10;
     private String randomStrInit() {
     	Random ran = new Random();
     	StringBuffer sb = new StringBuffer();
     	int num = 0;

     	do {
     		num = ran.nextInt(75) + 48;
     		if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
     			sb.append((char) num);
     		} else {
     			continue;
     		}

     	} while (sb.length() < size);
     	
     	if (lowerCheck) {
     		return sb.toString().toLowerCase();
     	}
     	return sb.toString();
     }
     


    //@RequestMapping("/EmailSend.do")
    public String EmailSend(String email, String pass) {
       final String fromEmail = "sz_toss@naver.com";
       final String toEmail = email;
       final String subject = "회원님의 임시비밀번호입니다(VOLUME) ";
       final String contents = ""+"회원님의 임시비밀번호는"+pass+"입니다.";//req.getParameter("contents").replace("\r\n", "<br/>");
       System.out.println(pass);
       System.out.println(email);
    
       final MimeMessagePreparator preparator = new MimeMessagePreparator() {         
          @Override
          public void prepare(MimeMessage mimeMessage) throws Exception {

             final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
             helper.setFrom(fromEmail); 
             helper.setTo(toEmail); 
             helper.setSubject(subject);  
             /*
              * http://localhost:8080/SpringSMTP/emailAuth.do?id=nakja&pass=1234&user_auth=1
              * 
              * <a href='http://localhost:8080/SpringSMTP/emailAuth.do?id=nakja&pass=1234&rndNum=112635489874'>���⸦Ŭ���ϸ�������</a>
              * 
              * */
             helper.setText(contents, true); 
          }
       };
       
       String returnStr = "";
       
       try {
          mailSender.send(preparator);
          returnStr = "success";
       }
       catch (Exception e) {
    	   System.out.println("메일보내기실패");
		   returnStr = "fail";
		   e.printStackTrace();
       }
       
       return returnStr;
    }
   

   // ȸ������
   @RequestMapping("/register")
   public String register(Model model) {
      return "login/register";
   }  

   @RequestMapping("/registerAction")
   public ModelAndView regiUserAction(Model model, HttpServletRequest req, HttpSession session) {
      ModelAndView mv = new ModelAndView();

      // ����,īī���� �����α��ν��ʿ�
      // String isNaver = req.getParameter("hiddenPw1");
      // String iskakao = req.getParameter("hiddenPw2");
      // String isgoogle = req.getParameter("hiddenPw3");

      UserDTO dto = new UserDTO();
      dto.setId(req.getParameter("id"));
      dto.setPass(req.getParameter("pass"));
      dto.setName(req.getParameter("name"));
      dto.setEmail(req.getParameter("email"));
      dto.setAuthority("USER");
      dto.setUserType("user");
      
      System.out.println("ȸ������");
      // ȸ�������ϱ�
      sqlSession.getMapper(UserImpl.class).regiUser(dto);

      // ��������
      System.out.println("����������");
      Temp temp = new Temp();
      String key = temp.getKey(false, 20);
      

      final String fromEmail = "sz_toss@naver.com";
      final String email = req.getParameter("email");
      final String id = req.getParameter("id");
      final String title = id + "님께(VOLUME올림)";
      final String htmlStr ="<div>"
               +"<div>"+ id +"님, 저희 서비스를 이용해주셔서 감사합니다.</div>"
               +"똑닥똑닥서비스 이용을 위해 고객님의 이메일을 인증해주시기 바랍니다.<br/>"
               +"이메일 인증이 완료되면 정상적으로 사이트 이용이 가능합니다.<br/>"
               + "<a href='http://localhost:8080" + req.getContextPath() + "/user/key_alter?id="+ id +"&user_key="+key+"'>인증하기</a><br/>"
               +"(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다) <br/>"
               +"<hr/>"
               +"똑닥똑닥드림"
            +"</div>";
      sqlSession.getMapper(UserImpl.class).GetKey(id, key);

      final MimeMessagePreparator preparator = new MimeMessagePreparator() {
         @Override
         public void prepare(MimeMessage mimeMessage) throws Exception {

            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            helper.setFrom(fromEmail);
            helper.setTo(email);
            helper.setSubject(title);
            helper.setText(htmlStr, true);
         }
      };

      try {
         mailSender.send(preparator);
         model.addAttribute("mailResult", "메일전송이되었습니다");
      } catch (Exception e) {
         System.out.println("메일인증오류");
         model.addAttribute("mailResult", "메일전송에 실패했어요1");
         e.printStackTrace();
      }

      session.setAttribute("login", dto);
      mv.setViewName("home");

      return mv;
   }

   // �̸��� ���� ��Ʈ�ѷ�('1�ιٲ�')
   @RequestMapping(value = "/user/key_alter", method = RequestMethod.GET)
   public String key_alterConfirm(@RequestParam("id") String id, @RequestParam("key") String key) {

      sqlSession.getMapper(UserImpl.class).alter_userKey(id, key);

      return "home";
   }

   @RequestMapping("/idCheck.do")
   @ResponseBody
   public String idCheck(HttpServletRequest req) {

      String result = "";
      int idOverlap = sqlSession.getMapper(UserImpl.class).idCheck(req.getParameter("id"));
      // System.out.println("idOverlap:"+idOverlap);
      if (idOverlap == 0)
         result = "true";
      else
         result = "false";

      return result;
   }

   // ------------------------------------- �Ҽ� �α���
   // ----------------------------------------

   NaverLoginBO naverLoginBO = new NaverLoginBO();

   @RequestMapping(value = "/naverLogin", method = RequestMethod.GET)
   public ModelAndView naverLogin(HttpSession session) {
      /* �׾Ʒ� ���� URL�� �����ϱ� ���Ͽ� getAuthorizationUrl�� ȣ�� */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

      return new ModelAndView("login/naverLogin", "url", naverAuthUrl);
   }

   @RequestMapping(value = "/callback", method = RequestMethod.GET)
   public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model,
         UserDTO userDTO) throws Exception {
      /* �׾Ʒ� ������ ���������� �Ϸ�Ǹ� code �Ķ���Ͱ� ���޵Ǹ� �̸� ���� access token�� �߱� */

      JsonParser json = new JsonParser();

      OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
      String apiResult = naverLoginBO.getUserProfile(oauthToken);
      userDTO = json.changeJson(apiResult); // dto�� userEmail����
      System.out.println("User Uid : " + userDTO.getEmail().substring(0, userDTO.getEmail().indexOf("@")));
      System.out.println("User Name : " + userDTO.getName());
      System.out.println("User Email : " + userDTO.getEmail());

      // sqlSession.getMapper(UserImpl.class).regiUser(userDTO);
      session.setAttribute("login", inputSocialUser(userDTO.getEmail().substring(0, userDTO.getEmail().indexOf("@")),
            userDTO.getName(), userDTO.getEmail(), "naver"));

      return "login/callback";
   }

   @Autowired
   private GoogleConnectionFactory googleConnectionFactory;
   @Autowired
   private OAuth2Parameters googleOAuth2Parameters;

   private org.springframework.social.oauth2.OAuth2Operations oauthOperations;

   // ȸ�� ���� ������
   @RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
   public String join(HttpServletResponse response, Model model) {

      oauthOperations = googleConnectionFactory.getOAuthOperations();
      String url = ((org.springframework.social.oauth2.OAuth2Operations) oauthOperations)
            .buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
      System.out.println("/googleLogin, url : " + url);
      model.addAttribute("google_url", url);

      return "login/googleLogin";
   }

   // ------------------------------------ ���� �ݹ�
   // ----------------------------------------

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

      /*
       * UserDTO userDTO=new UserDTO(); userDTO.setId(profile.getId());
       * userDTO.setName(profile.getDisplayName());
       * userDTO.setEmail(profile.getAccountEmail());
       * userDTO.setPass(profile.getAccountEmail()); userDTO.setUserType("google");
       * sqlSession.getMapper(UserImpl.class).regiUser(userDTO);
       */
      String id = profile.getAccountEmail().substring(0, profile.getAccountEmail().indexOf("@"));
      session.setAttribute("login", inputSocialUser(id, id, profile.getAccountEmail(), "google"));

      // Access Token ���
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

   // īī�� �α��� �α׾ƿ�
   private kakao_restapi kakao_restapi = new kakao_restapi();

   @RequestMapping(value = "/oauth", produces = "application/json")
   public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
      System.out.println("�α��� �Ҷ� �ӽ� �ڵ尪");
      // īī�� Ȩ���������� ���� ��� �ڵ�
      System.out.println(code);
      System.out.println("�α��� �� �����");

      // īī�� rest api ��ü ����
      kakao_restapi kr = new kakao_restapi();
      // ������� node�� �����
      JsonNode node = kr.getAccessToken(code);
      // ����� ���
      System.out.println(node);
      // ��� �ȿ� �ִ� access_token���� ���� ���ڿ��� ��ȯ
      String token = node.get("access_token").toString();
      // ���ǿ� ����ش�.
      session.setAttribute("token", token);

      // access_token�� ���� ����� ���� ��û
      JsonNode userInfo = kakao_restapi.getKakaoUserInfo(node.get("access_token"));

      // Get id
      String id = userInfo.path("id").asText();
      String name = null;
      String email = null;

      // �������� īī������ �������� Get properties
      JsonNode properties = userInfo.path("properties");
      JsonNode kakao_account = userInfo.path("kakao_account");

      name = properties.path("nickname").asText();
      email = kakao_account.path("email").asText();

      System.out.println("id : " + id);
      System.out.println("name : " + name);
      System.out.println("email : " + email);

      session.setAttribute("login", inputSocialUser(email.substring(0, email.indexOf("@")), name, email, "kakao"));

      return "redirect:/";
   }

   @RequestMapping("/logout")
   public String logout(Model model, HttpSession session) {
      session.removeAttribute("login");
      model.addAttribute("logoutMsg", " ");

      return "redirect:/";
   }
   /*
    * @RequestMapping(value = "/logout", produces = "application/json") public
    * String Logout(HttpSession session) { //kakao restapi ��ü ���� kakao_restapi kr =
    * new kakao_restapi(); //��忡 �α׾ƿ��� ������� ����� �Ű������� ���ǿ� �մ� token�� ������ ���ڿ��� ��ȯ
    * JsonNode node = kr.Logout(session.getAttribute("token").toString()); //��� ��
    * ��� System.out.println("�α��� �� ��ȯ�Ǵ� ���̵� : " + node.get("id")); return
    * "redirect:/"; }
    */

   public UserDTO inputSocialUser(String id, String name, String email, String userType) {
      UserDTO userDTO = new UserDTO();
      if (sqlSession.getMapper(UserImpl.class).idCheck(id) == 0) {
         userDTO.setId(id);
         userDTO.setName(name);
         userDTO.setEmail(email);
         userDTO.setPass(email);
         userDTO.setAuthority("USER");
         userDTO.setUserType(userType);
         sqlSession.getMapper(UserImpl.class).regiUser(userDTO);
      } else
         userDTO = sqlSession.getMapper(UserImpl.class).getUser(id);

      return userDTO;
   }
}