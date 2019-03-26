package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Dao;

@WebServlet("/Login.do")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pass=req.getParameter("pass");
		
		if(Dao.getInstance().getAdmin(id, pass)) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("authority", "ADMIN");
			resp.sendRedirect("./admin/UserMain.jsp");
		}
		else {
			req.getRequestDispatcher("./index.jsp?msg=false").forward(req, resp);
		}
	}
}
