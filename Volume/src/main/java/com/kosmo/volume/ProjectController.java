package com.kosmo.volume;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.PagingUtil;
import model.ParamDTO;
import model.ProjectBbsDAOImpl;
import model.ProjectBbsDTO;

@Controller
public class ProjectController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/ProjectController.do")
	public String ProjectBbs(Model model, HttpServletRequest req) {
		
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
		int totalRecordCount = sqlSession.getMapper(ProjectBbsDAOImpl.class).getTotalCountSearch(paramDTO);
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
		ArrayList<ProjectBbsDTO> lists = sqlSession.getMapper(ProjectBbsDAOImpl.class).listPageSearch(paramDTO);
		
		//페이지 처리
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/ProjectController.do?"+addQueryString);
		
		model.addAttribute("pagingImg",pagingImg); 
		
		//줄바꿈처리
		for(ProjectBbsDTO dto : lists) {
			String temp = dto.getContent().replace("\r\n", "<br/>");
		dto.setContent(temp);	
		
		}
		model.addAttribute("lists",lists);
		return "ProjectBbs";
	}	
	
	
	@RequestMapping("Calendar.do")
	public String fullcalendar (Model model) {
		
		
		return "fullcalendarView";
	}
	
	
	@RequestMapping(value="/CalendarView.do")
    @ResponseBody
    public ArrayList<ProjectBbsDTO> projectBbsView(Model model){
      ArrayList<ProjectBbsDTO> list = new ArrayList<ProjectBbsDTO>();
      System.out.println("이동");
      //에러발생
      //ArrayList<ProjectBbsDTO> clists = sqlSession.getMapper(ProjectBbsDAOImpl.class).clist();
      ArrayList<ProjectBbsDTO> clist= sqlSession.getMapper(ProjectBbsDAOImpl.class).clist();
      
      System.out.println(clist);
      for(ProjectBbsDTO dto : clist) {
         System.out.println(dto.getId().toString());
      }
      if(clist==null) {
      }
      else {
         list.addAll(clist);
         
      }
        return list;
    }
	
	
	
	   @RequestMapping("ProjectBbsViewController.do")
	   public String PrjectBbsView(Model model , HttpServletRequest req) {
	      String idx= req.getParameter("idx");
	      ArrayList<ProjectBbsDTO> lists = sqlSession.getMapper(ProjectBbsDAOImpl.class).listView(idx);
	       /*
	      String talent = dto.getTalent();
	       
	      if(talent!=null) {
	           String tl = "유영선,한국일,김봉섭,신승호";
	            
	            
	            int lineCnt = 0;
	             int fromIndex = -1;
	             while ((fromIndex = tl.indexOf(",", fromIndex + 1)) >= 0) {
	               lineCnt++;
	             }


	            
	            String re ="";
	            ArrayList<String> text = new ArrayList<String>();
	            for(int i = 0; i<lineCnt; i++) {
	               int su;
	               su = tl.indexOf(",");
	               re = tl.substring(0, su);
	               text.add(re);
	               tl = tl.substring(su+1);
	            }
	            text.add(tl);
	            
	            for(int i=0; i<text.size(); i++) {
	               System.out.println(text.get(i));
	            }
	            
	            String member ="유영선1,한국일1";
	            
	            int memlineCnt = 0;
	             int memfromIndex = -1;
	             while ((memfromIndex = member.indexOf(",", memfromIndex + 1)) >= 0) {
	                memlineCnt++;
	             }
	            
	            ArrayList<String> memList = new ArrayList<String>();
	            for(int i = 0; i<memlineCnt; i++) {
	               int su;
	               su = member.indexOf(",");
	               re = member.substring(0, su);
	               memList.add(re);
	               member = member.substring(su+1);
	            }
	            memList.add(member);
	            
	            for(int i=0; i<memList.size(); i++) {
	               System.out.println("mem"+memList.get(i));
	            }
	            
	            int m = 0;
	            
	            for(int i=0; i<text.size(); i++) {
	               for(int j=0; j<memList.size(); j++) {
	                  if(text.get(i).equals(memList.get(j))){
	                     m=1;
	                  }
	               }
	            }
	            System.out.println(m);
	           

	         } */
	      model.addAttribute("lists",lists);

	      return "ProjectBbsView";
	   }
	   
	   @RequestMapping("ProjectBbsWriteController.do")
	   public String PrjectBbsWrite(Model model , HttpServletRequest req) {
		   
		
		   
		   return "ProjectBbsWrite";
	   }
}
