package com.kosmo.volume;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import android.AndroidImpl;
import user.UserDTO;

@Controller
public class AndroidController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/androidLogin", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject login(HttpServletRequest req){
		String id=req.getParameter("id");
		String pass=req.getParameter("pass");
		System.out.println("안드로이드 id: "+id +", pass: "+pass);
		JSONArray jsonArr=new JSONArray();
		JSONObject jsonObj=new JSONObject();
		UserDTO dto=new UserDTO();
		dto.setId(id);
		dto.setPass(pass);
		dto=sqlSession.getMapper(AndroidImpl.class).userCheck(dto);
		
		if (dto==null) {
			jsonObj.put("result", 0);
		}
		else {
			jsonObj.put("result", 1);
			jsonObj.put("id", dto.getId());
			jsonObj.put("pass", dto.getPass());/*
			jsonObj.put("email", dto.getEmail());
			jsonObj.put("enabled", dto.getEnabled());
			jsonObj.put("authority", dto.getAuthority());*/
		}
		jsonArr.add(jsonObj);

		return jsonObj;
		//return jsonArr;
	}
}
