package admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.Dao;
import model.UserDTO;
import util.PagingUtil;

@WebServlet("/admin/UserCtrl.do")
public class UserCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8;");
		String id=req.getParameter("id");
		String menu=req.getParameter("menu");
		
		UserDTO dto=new UserDTO();
		
		ServletContext application=this.getServletContext();
		
		switch (menu) {
		case "list":
			Map param=new HashMap();
			
			//파라미터를 쿼리스트링 형태로 만들기위한 변수생성 (페이지번호 이동 - get방식으로 싣어서 보내기 위해)
			/*String addQueryString="";
			String searchColumn=req.getParameter("searchColumn");
			String searchWord=req.getParameter("searchWord");
			
			if(searchColumn!=null) {
				addQueryString=String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
				
				param.put("Column", searchColumn);
				param.put("Word", searchWord);
			}*/
			
			//자료실 게시판의 게시물갯수 반환
			int totalRecordCount=Dao.getInstance().getTotalRecordCount(param);
			
			//페이지처리 추가부분 (web.xml에서 초기화 파라미터 가져오기)
			int pageSize=Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
			int blockPage=Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
			
			//전체 페이지 수 계산
			int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
			
			System.out.println("전체 레코드 수: "+totalRecordCount);
			System.out.println("전체 페이지 수: "+totalPage);
			
			//현재 페이지번호에 따라 파라미터를 받는다. 단, 최초접속시에는 페이지번호가 없으므로 이 때는 1페이지로 설장한다.
			int nowPage=(req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))?
					1:Integer.parseInt(req.getParameter("nowPage"));
			
			//가져올 레코드의 구간을 결정하기 위한 연산. 해당 start와 end는 select문에서 rownum을 통한 구간을 결정할 때 사용됨
			int start=(nowPage-1)*pageSize+1;
			int end=nowPage*pageSize;
			
			param.put("start", start);
			param.put("end", end);
			
			param.put("totalPage", totalPage);//전체페이지 수
			param.put("nowPage", nowPage);//현재페이지
			param.put("totalCount", totalRecordCount);//전체레코드 수
			param.put("pageSize", pageSize);//한 페이지에 출력할 게시물 수 수
			
			
			param.put("totalCount", totalRecordCount);
			
			//dao호출하여 레코드 가져오기(페이지처리o)
			List<UserDTO> lists=Dao.getInstance().selectPaging(param);
			
			//페이지 처리를 위한 문자열 생성
			//String pagingImg=PagingUtil.pagingImgServlet(totalRecordCount,pageSize,blockPage,nowPage, "../DataRoom/DataList?"+addQueryString);
			/*req.setAttribute("check", lists.get(0).getTitle().substring(0, 3));*/
			String pagingImg=PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, "../UserMain");
			
			//view로 데이터를 전달하기 위해 request객체에 속성 저장
			req.setAttribute("lists", lists);
			req.setAttribute("map", param);
			
			//페이지번호 출력문자열 저장
			application.setAttribute("pagingImg", pagingImg);
			
			String resultJSON2=getJSON2();
			resp.getWriter().write(resultJSON2);			
		case "search":
			String resultJSON=getJSON(id);
			resp.getWriter().write(resultJSON);
			break;
		case "delete":
			Dao.getInstance().deleteUser(id);
			break;
		case "modify":
			dto.setId(id);
			dto.setName(req.getParameter("name"));
			//dto.setRegidate(req.getParameter("regidate"));
			dto.setEmail(req.getParameter("email"));
			dto.setPoint(Integer.parseInt(req.getParameter("point")));
			dto.setEnabled(Integer.parseInt(req.getParameter("enabled")));
			dto.setAuthority(req.getParameter("authority"));
			dto.setUserType(req.getParameter("userType"));
			Dao.getInstance().modifyUser(dto);
			break;
		case "view":
			JSONObject jsonObj=new JSONObject();
			dto=Dao.getInstance().getUser(id);
			jsonObj.put("id", dto.getId());
			jsonObj.put("name", dto.getName());
			jsonObj.put("regidate", dto.getRegidate());
			jsonObj.put("email", dto.getEmail());
			jsonObj.put("point", dto.getPoint());
			jsonObj.put("enabled", dto.getEnabled());
			jsonObj.put("authority", dto.getAuthority());
			jsonObj.put("userType", dto.getUserType());
			resp.getWriter().write(jsonObj.toString());
			break;
		case "pause":
			Dao.getInstance().pauseUser(id);
			break;
		case "activate":
			Dao.getInstance().activateUser(id);
			break;
		default:
			break;
		}
	}
	
	public String getJSON(String id) {
		//JSON배열을 만들기 위한 선언
		JSONArray jsonArr=new JSONArray();
		
		List<UserDTO> lists=Dao.getInstance().searchUser(id);
		
		for (UserDTO u : lists) {
			JSONObject jsonObj=new JSONObject();
			
			jsonObj.put("id", u.getId());		
			jsonObj.put("name",u.getName());
			jsonObj.put("regidate", u.getRegidate());
			jsonObj.put("email", u.getEmail());
			jsonObj.put("point", u.getPoint());
			jsonObj.put("enabled", u.getEnabled());
			jsonObj.put("authority", u.getAuthority());
			jsonObj.put("userType", u.getUserType());
			jsonArr.add(jsonObj);
		}
		
		return jsonArr.toString();
	}
	public String getJSON2() {
		//JSON배열을 만들기 위한 선언
		JSONArray jsonArr=new JSONArray();
		
		List<UserDTO> lists=Dao.getInstance().getUserList();
		
		for (UserDTO u : lists) {
			JSONObject jsonObj=new JSONObject();
			
			jsonObj.put("id", u.getId());		
			jsonObj.put("name",u.getName());
			jsonObj.put("regidate", u.getRegidate());
			jsonObj.put("email", u.getEmail());
			jsonObj.put("point", u.getPoint());
			jsonObj.put("enabled", u.getEnabled());
			jsonObj.put("authority", u.getAuthority());
			jsonObj.put("userType", u.getUserType());
			jsonArr.add(jsonObj);
		}
		
		return jsonArr.toString();
	}
	
}
