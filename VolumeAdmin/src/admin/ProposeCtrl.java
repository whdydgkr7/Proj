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

import model.ProjectBbsDTO;
import model.ProposeDAO;

@WebServlet("/admin/ProposeCtrl.do")
public class ProposeCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8;");
		ProposeDAO dao= new ProposeDAO();
		
		int idx;
		String menu=req.getParameter("menu");
		ProjectBbsDTO dto=new ProjectBbsDTO();
		
		switch (menu) {
		case "view":
			String resultJSON=getJSON();
			resp.getWriter().write(resultJSON);
			break;
		case "submit":
			idx= Integer.parseInt(req.getParameter("idx"));
			ProposeDAO.getInstance().submitPropose(idx);
			resp.getWriter().write("등록에 성공 했습니다.");
			break;
		case "refuse":
			idx=Integer.parseInt(req.getParameter("idx"));
			if(ProposeDAO.getInstance().refusePropose(idx))
				resp.getWriter().write("제안을 거절 했습니다.");
			else resp.getWriter().write("제안을 거절을 실패했습니다.");
			break;
		default:
			break;
		}
	}
	
	public String getJSON() {
		//JSON배열을 만들기 위한 선언
		JSONArray jsonArr=new JSONArray();
		
		List<ProjectBbsDTO> lists=ProposeDAO.getInstance().highRecommandPropose();
		
		for (ProjectBbsDTO p : lists) {
			JSONObject jsonObj=new JSONObject();
			
			jsonObj.put("idx", p.getIdx());
			jsonObj.put("id", p.getId());
			jsonObj.put("content", p.getContent());
			jsonObj.put("postdate", p.getPostdate().toString());
			jsonObj.put("visit_count", p.getVisit_count());
			jsonObj.put("recommend", p.getRecommend());
			jsonObj.put("title", p.getTitle());
			jsonObj.put("start_date", p.getStart_date().toString());
			jsonObj.put("end_date", p.getEnd_date().toString());
			jsonObj.put("p_limit", p.getM_limit());
			jsonObj.put("thumbnail", p.getThumbnail());
			jsonObj.put("attachedfile", p.getAttachedfile());
			jsonObj.put("address", p.getAddress());
			jsonArr.add(jsonObj);
		}
		//System.out.println(jsonArr.toString());
		
		return jsonArr.toString();
	}
	
}
