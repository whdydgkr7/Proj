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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.ProjectBbsDTO;
import myPage.MyPageImpl;

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
	public String MyInfo(Model model) {
		return "MyPage/MyInformodifi";
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
