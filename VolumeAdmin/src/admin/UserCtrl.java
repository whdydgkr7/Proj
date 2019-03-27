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
