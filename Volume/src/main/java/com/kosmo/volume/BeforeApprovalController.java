package com.kosmo.volume;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
	

import model.BeforeApprovalDTO;
import model.BeforeApprovalImpl;
import model.PagingUtil;
import model.ParamDTO;


@Controller
public class BeforeApprovalController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/BeforeApproval.do")
	public String BeforeApproval(Model model, HttpServletRequest req) {
		
		//검색 처리
		ParamDTO paramDTO= new ParamDTO();
		String addQueryString="";
		String keyField = req.getParameter("keyField");
		String keyString = req.getParameter("keyString");
		if(keyString!=null) {
			addQueryString=String.format("keyField=%s"+"%keyString=%s&",keyField,keyString);
		
			paramDTO.setKeyField(keyField);
			paramDTO.setKeyString(keyString);
		}
		
		//검색어 처리
		int totalRecordCount = sqlSession.getMapper(BeforeApprovalImpl.class).getTotalCount();
		//검색어에 따른 레코드 갯수 확인용 
		System.out.println("totalRecordCount="+
									totalRecordCount);		
		
		
		//페이지 처리를 위한 설정값
		int pageSize = 10;
		int blockPage = 5;
		
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
		
		//시작 및 끝 rownum 구하기
		int nowPage = req.getParameter("nowPage")==null?1:Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage-1)*pageSize+1;
		int end = nowPage * pageSize;
		
		
		//검색처리를 위한 추가부분
		paramDTO.setStart(start);
		paramDTO.setEnd(end);
		
		
		/*Mybatis 이용*/
		ArrayList<BeforeApprovalDTO> lists = sqlSession.getMapper(BeforeApprovalImpl.class).listPageSearch(paramDTO);
		
		//페이지 처리
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/BeforeApproval.do?"+addQueryString);
		
		model.addAttribute("pagingImg",pagingImg); 
		
		//줄바꿈처리
		for(BeforeApprovalDTO dto : lists) {
			String temp = dto.getContent().replace("\r\n", "<br/>");
		dto.setContent(temp);	
		
		}
		model.addAttribute("lists",lists);
		return "BeforeApproval";
	}	


	
   @RequestMapping("BeforeApprovalViewController.do")
	   public String PrjectBbsView(Model model , HttpServletRequest req) {
	      String idx= req.getParameter("idx");
	      ArrayList<BeforeApprovalDTO> lists = sqlSession.getMapper(BeforeApprovalImpl.class).listView(idx);
	
	      model.addAttribute("lists",lists);

	      return "BeforeApprovalView";
	   }
	   
/*	   @RequestMapping("ProjectBbsWriteController.do")
	   public String PrjectBbsWrite(Model model , HttpServletRequest req) {
		   
		
		   
		   return "ProjectBbsWrite";
	   }	*/
	
	
	
}
