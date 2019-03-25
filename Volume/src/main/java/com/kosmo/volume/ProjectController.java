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
import model.PcommentDTO;
import model.ProjectBbsDAOImpl;
import model.ProjectBbsDTO;
import model.ReviewDTO;

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
    public ArrayList<ProjectBbsDTO> projectBbsView(Model model, HttpServletRequest req){
      ArrayList<ProjectBbsDTO> list = new ArrayList<ProjectBbsDTO>();
      
      ArrayList<ProjectBbsDTO> clist= sqlSession.getMapper(ProjectBbsDAOImpl.class).clist();

      if(clist==null) {
      }
      else {
         list.addAll(clist);
         
      }
        return list;
    }
   
   
   //페이지이동(댓글뿌리기) 조회수증가
      @RequestMapping("ProjectBbsViewController.do")
      public String PrjectBbsView(Model model , HttpServletRequest req) {
         String idx= req.getParameter("idx");
         ArrayList<ProjectBbsDTO> lists = sqlSession.getMapper(ProjectBbsDAOImpl.class).listView(idx);
         ArrayList<PcommentDTO> pcomment= sqlSession.getMapper(ProjectBbsDAOImpl.class).viewcommend(idx);
         sqlSession.getMapper(ProjectBbsDAOImpl.class).visitcount(idx);
         //ArrayList<ReviewDTO> reviewCount= sqlSession.getMapper(ProjectBbsDAOImpl.class).reviewCount(idx);
         
        model.addAttribute("pcomment",pcomment);
         model.addAttribute("lists",lists);

         return "ProjectBbsView";
      }
      //http://localhost:8080/Volume/ProjectBbsViewController.do?idx=2
      //댓글달기
      @RequestMapping(value="/DataComment.do",produces="text/plain;charset=UTF-8")
      public String DataComment(HttpServletRequest req) {
         
         PcommentDTO PDTO= new PcommentDTO();
         String idx= req.getParameter("idx");
         PDTO.setIdx(Integer.parseInt(req.getParameter("idx")));
         PDTO.setId(req.getParameter("id"));
         PDTO.setContent(req.getParameter("content"));
         sqlSession.getMapper(ProjectBbsDAOImpl.class).pcomment(PDTO);
         
         return "redirect:ProjectBbsViewController.do?idx="+idx;
      }
      //댓글삭제
      @RequestMapping("pcDelete")
      public String pcDelete(HttpServletRequest req) {
         
         String idx= req.getParameter("idx");
         String cidx= req.getParameter("cidx");
         
         sqlSession.getMapper(ProjectBbsDAOImpl.class).cdelete(idx, cidx);
         
         return "redirect:ProjectBbsViewController.do?idx="+idx;
      }
      
      //참가신청완료
      @RequestMapping("/lock")
      public String lock(HttpServletRequest req) {
          String idx= req.getParameter("idx");
          String id= req.getParameter("id");
          
         
         return "redirect:ProjectBbsViewController.do?idx="+idx;
         
      }
   
      
      
      
      
      
      
      
      
      
      
      
   @RequestMapping("ProjectBbsWriteController.do")
   public String PrjectBbsWrite(Model model , HttpServletRequest req) {
      
   
      
      return "ProjectBbsWrite";
   }
}