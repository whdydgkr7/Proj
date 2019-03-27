package com.kosmo.volume;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.OnedayDTO;
import model.OnedayImpl;
import model.PagingUtil;
import model.ParamDTO;
import model.ProjectBbsDAOImpl;
import model.ProjectBbsDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired 
	SqlSession sqlSession;
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );
		
		ArrayList<ProjectBbsDTO> projectBbsDTO = sqlSession.getMapper(ProjectBbsDAOImpl.class).mainpbbs();
		
		model.addAttribute("projectBbsDTO",projectBbsDTO);
		
		ArrayList<OnedayDTO> onedayDTO = sqlSession.getMapper(OnedayImpl.class).mainebbs();
		
		model.addAttribute("onedayDTO",onedayDTO);
		
		return "home";
	}
	
	@RequestMapping("/adminMain")
	public String adminMain(Model model) {
		return "admin/adminMain";
	}

}
