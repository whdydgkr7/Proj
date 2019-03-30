package com.kosmo.volume;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.ProjectBbsDTO;
import myPage.MyPageImpl;
import user.UserDTO;
import user.UserImpl;

@Controller
public class MyPageController {

	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("/MyPageProjView")
	@ResponseBody
	public ArrayList<ProjectBbsDTO> myPageProjView(Model model, HttpServletRequest req) {
		ArrayList<ProjectBbsDTO> list=sqlSession.getMapper(MyPageImpl.class).ViewProj(req.getParameter("id"));
		return list;
	}
	

	@RequestMapping("MyPage")
	public String Mypage(Model model) {
		return "MyPage/MyPageMain";
		
	}
	

	
	@RequestMapping("/MyInfo.do")
	public String MyInfo(HttpSession session,Model model) {
		
		UserDTO login=(UserDTO) session.getAttribute("login");
		
		model.addAttribute("login",login);
		
		
		return "MyPage/MyInforView";
	}
	
	@RequestMapping("/modifiAction.do")
	public String ModifiAction(HttpSession session, Model model, HttpServletRequest req) {

		UserDTO login=(UserDTO) session.getAttribute("login");
		
		model.addAttribute("login",login);
		
		return "MyPage/MyInformodifi";
	}
	
	@RequestMapping("/modifityAction.do")
	public String modifityAction(HttpSession session, Model model, HttpServletRequest req) {
		String id=req.getParameter("id");
		String pass=req.getParameter("pass");
		String email=req.getParameter("email");
		String name=req.getParameter("name");
		
		System.out.println("1"+id);
		System.out.println("2"+pass);
		System.out.println("3"+email);
		System.out.println("4"+name);
		
		
		sqlSession.getMapper(UserImpl.class).Modifi(name, email, pass, id);
		
		
		return "redirect:/loginAction?id="+id+"&pass="+pass;
	}
	
	
	@RequestMapping("/MyTakeProject.do")
	public String MyTakeProject(Model model, HttpSession session ) {
		String id=(String) session.getAttribute("login.id");
		
		ArrayList<ProjectBbsDTO> list=sqlSession.getMapper(MyPageImpl.class).ViewMyProj(id);
		
		model.addAttribute("list",list);
		
		
		
		
		
		return "MyPage/MyTakeProject";
	}
	
	@RequestMapping("/MyOfferProject.do")
	public String MyOfferProject(Model model) {
		return "MyPage/MyOfferProject";
	}
	@RequestMapping("/MyOneDayClass.do")
	public String MyOneDayClass(Model model) {
		return "MyPage/MyOneDayClass";
	}
	@RequestMapping("/MyProjectLatter.do")
	public String MyProjectLatter(Model model) {
		return "MyPage/MyProjectLatter";
	}
	
	
}
