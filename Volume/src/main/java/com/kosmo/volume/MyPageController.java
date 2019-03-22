package com.kosmo.volume;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping("/MyPage")
	public String Mypage(Model model) {
		return "MyPage/MyPageMain";
	}
	
	@RequestMapping("/MyPageProjView")
	@ResponseBody
	public ArrayList<ProjectBbsDTO> myPageProjView(Model model, HttpServletRequest req) {
		ArrayList<ProjectBbsDTO> list=sqlSession.getMapper(MyPageImpl.class).ViewProj(req.getParameter("id"));
		return list;
	}
}
