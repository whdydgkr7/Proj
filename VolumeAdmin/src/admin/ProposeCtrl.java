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

import model.ProposeDAO;
import model.ProposeDTO;

@WebServlet("/admin/ProposeCtrl.do")
public class ProposeCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8;");
		int propose_idx;
		String menu=req.getParameter("menu");
		ProposeDTO dto=new ProposeDTO();
		
		switch (menu) {
		case "view":
			String resultJSON=getJSON();
			resp.getWriter().write(resultJSON);
			break;
		case "submit":
			propose_idx=Integer.parseInt(req.getParameter("propose_idx"));
			dto=ProposeDAO.getInstance().getPropose(propose_idx);
			if(ProposeDAO.getInstance().submitPropose(dto))
				resp.getWriter().write("등록에 성공 했습니다.");
			else resp.getWriter().write("등록 실패입니다.");
			break;
		case "refuse":
			propose_idx=Integer.parseInt(req.getParameter("propose_idx"));
			if(ProposeDAO.getInstance().refusePropose(propose_idx))
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
		
		List<ProposeDTO> lists=ProposeDAO.getInstance().highRecommandPropose();
		
		for (ProposeDTO p : lists) {
			JSONObject jsonObj=new JSONObject();
			
			jsonObj.put("propose_idx", p.getPropose_idx());
			jsonObj.put("id", p.getId());
			jsonObj.put("content", p.getContent());
			jsonObj.put("postdate", p.getPostdate().toString());
			jsonObj.put("visit_count", p.getVisit_count());
			jsonObj.put("recommend", p.getRecommend());
			jsonObj.put("title", p.getTitle());
			jsonObj.put("start_date", p.getStart_date().toString());
			jsonObj.put("end_date", p.getEnd_date().toString());
			jsonObj.put("p_limit", p.getP_limit());
			jsonObj.put("thumbnail", p.getThumbnail());
			jsonObj.put("attachedfile", p.getAttachedfile());
			jsonObj.put("address", p.getAddress());
			jsonArr.add(jsonObj);
		}
		//System.out.println(jsonArr.toString());
		
		return jsonArr.toString();
	}
	
}
