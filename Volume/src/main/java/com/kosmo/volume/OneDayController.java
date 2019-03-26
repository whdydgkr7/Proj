package com.kosmo.volume;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OneDayController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/oneDay")
	public String oneDay(Model model) {
		return "oneDay/oneDay";
	}
}
