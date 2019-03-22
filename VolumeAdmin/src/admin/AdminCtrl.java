package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.Dao;
import model.UserDTO;

@WebServlet("/admin/AdminCtrl.do")
public class AdminCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8;");
		String menu=req.getParameter("menu");
		UserDTO dto=new UserDTO();
		
		switch (menu) {
		case "view":
			String resultJSON=getJSON();
			resp.getWriter().write(resultJSON);
			break;
		case "add":
			dto.setId(req.getParameter("id"));
			dto.setPass(req.getParameter("pass"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setPoint(Integer.parseInt(req.getParameter("point")));
			dto.setEnabled(Integer.parseInt(req.getParameter("enabled")));
			dto.setAuthority(req.getParameter("authority"));
			if(Dao.getInstance().addAdmin(dto)) resp.getWriter().write("새로운 관리자를 추가했습니다.");
			else resp.getWriter().write("관리자 추가에 실패했습니다.");
			break;
		case "modView":
			JSONObject jsonObj=new JSONObject();
			dto=Dao.getInstance().getAdmin(req.getParameter("id"));
			jsonObj.put("id", dto.getId());
			jsonObj.put("pass", dto.getPass());
			jsonObj.put("name", dto.getName());
			jsonObj.put("regidate", dto.getRegidate());
			jsonObj.put("email", dto.getEmail());
			jsonObj.put("point", dto.getPoint());
			jsonObj.put("enabled", dto.getEnabled());
			jsonObj.put("authority", dto.getAuthority());
			resp.getWriter().write(jsonObj.toString());
			break;
		case "modify":
			dto.setId(req.getParameter("id"));
			dto.setPass(req.getParameter("pass"));
			dto.setName(req.getParameter("name"));
			//dto.setRegidate(req.getParameter("regidate"));
			dto.setEmail(req.getParameter("email"));
			dto.setPoint(Integer.parseInt(req.getParameter("point")));
			dto.setEnabled(Integer.parseInt(req.getParameter("enabled")));
			dto.setAuthority(req.getParameter("authority"));
			Dao.getInstance().modifyAdmin(dto);
			break;
		case "delete":
			Dao.getInstance().deleteUser(req.getParameter("id"));
			break;
		default:
			break;
		}
	}
	public String getJSON() {
		//JSON배열을 만들기 위한 선언
		JSONArray jsonArr=new JSONArray();
		
		List<UserDTO> lists=Dao.getInstance().getAdminList();
		
		for (UserDTO u : lists) {
			JSONObject jsonObj=new JSONObject();
			
			jsonObj.put("id", u.getId());		
			jsonObj.put("pass", u.getPass());		
			jsonObj.put("name",u.getName());
			jsonObj.put("regidate", u.getRegidate());
			jsonObj.put("email", u.getEmail());
			jsonObj.put("point", u.getPoint());
			jsonObj.put("enabled", u.getEnabled());
			jsonObj.put("authority", u.getAuthority());
			jsonArr.add(jsonObj);
		}
		//System.out.println(jsonArr.toString());
		
		return jsonArr.toString();
	}
}
