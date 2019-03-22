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

import model.OnedayDAO;
import model.OnedayDTO;

@WebServlet("/admin/OnedayCtrl.do")
public class OnedayCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8;");
		int idx;
		String menu=req.getParameter("menu");
		OnedayDTO dto=new OnedayDTO();
		
		switch (menu) {
		case "view":
			String resultJSON=getJSON();
			resp.getWriter().write(resultJSON);
			break;
		case "delete":
			idx=Integer.parseInt(req.getParameter("idx"));
			if(OnedayDAO.getInstance().deleteOneday(idx))
				resp.getWriter().write("삭제 성공 했습니다.");
			else resp.getWriter().write("삭제 실패입니다.");
			break;
		/*case "refuse":
			idx=Integer.parseInt(req.getParameter("propose_idx"));
			if(ProposeDAO.getInstance().refusePropose(propose_idx))
				resp.getWriter().write("제안을 거절 했습니다.");
			else resp.getWriter().write("제안을 거절을 실패했습니다.");
			break;*/
		default:
			break;
		}
	}
	
	public String getJSON() {
		//JSON배열을 만들기 위한 선언
		JSONArray jsonArr=new JSONArray();
		
		List<OnedayDTO> lists=OnedayDAO.getInstance().highReportCountOneday();
		
		for (OnedayDTO p : lists) {
			JSONObject jsonObj=new JSONObject();	
			jsonObj.put("report_count", p.getReport_count());
			jsonObj.put("idx", p.getIdx());
			jsonObj.put("id", p.getId());
			jsonObj.put("postdate", p.getPostdate().toString());
			jsonObj.put("title", p.getTitle());
			jsonArr.add(jsonObj);
		}
		//System.out.println(jsonArr.toString());
		
		return jsonArr.toString();
	}
	
}
