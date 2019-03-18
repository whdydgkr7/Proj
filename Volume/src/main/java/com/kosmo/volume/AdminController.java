package com.kosmo.volume;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import admin.AdminImpl;
import user.UserDTO;

@RestController
public class AdminController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/ViewUserList.do")
	public ArrayList<UserDTO> ViewUserList(Model model){
		return sqlSession.getMapper(AdminImpl.class).ViewUserList();
	}
}
