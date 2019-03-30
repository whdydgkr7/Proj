package com.kosmo.volume;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;


import model.ProjectBbsDTO;
import model.BeforeApprovalImpl;
import model.PagingUtil;
import model.ParamDTO;
import model.ProjectBbsDAOImpl;
import model.ProjectBbsDTO;

@Controller
public class BeforeApprovalController {

   @Autowired
   SqlSession sqlSession;

   @Autowired
   ServletContext servletContext;

   @RequestMapping("/BeforeApproval.do")
   public String BeforeApproval(Model model, HttpServletRequest req) {

      // 검색 처리
      ParamDTO paramDTO = new ParamDTO();
      String addQueryString = "";
      String keyField = req.getParameter("keyField");
      String keyString = req.getParameter("keyString");
      if (keyString != null) {
         addQueryString = String.format("keyField=%s" + "%keyString=%s&", keyField, keyString);

         paramDTO.setKeyField(keyField);
         paramDTO.setKeyString(keyString);
      }

      // 검색어 처리
      int totalRecordCount = sqlSession.getMapper(BeforeApprovalImpl.class).getTotalCount();
      // 검색어에 따른 레코드 갯수 확인용
      System.out.println("totalRecordCount=" + totalRecordCount);

      // 페이지 처리를 위한 설정값
      int pageSize = 5;
      int blockPage = 10;

      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

      // 시작 및 끝 rownum 구하기
      int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
      int start = (nowPage - 1) * pageSize + 1;
      int end = nowPage * pageSize;

      // 검색처리를 위한 추가부분
      paramDTO.setStart(start);
      paramDTO.setEnd(end);

      /* Mybatis 이용 */
      ArrayList<ProjectBbsDTO> lists = sqlSession.getMapper(BeforeApprovalImpl.class).listPageSearch(paramDTO);

      // 페이지 처리
      String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
            req.getContextPath() + "/BeforeApproval.do?" + addQueryString);

      model.addAttribute("pagingImg", pagingImg);

      // 줄바꿈처리
      for (ProjectBbsDTO dto : lists) {
         String temp = dto.getContent().replace("\r\n", "<br/>");
         dto.setContent(temp);

      }

   
      model.addAttribute("lists", lists);
      return "BeforeApproval";
   }
   

   // 상세보기
   @RequestMapping("BeforeApprovalViewController.do")
   public String PrjectBbsView(Model model, HttpServletRequest req) {
      String idx = req.getParameter("idx");
      ProjectBbsDTO ProjectBbsDTO = new ProjectBbsDTO();

      ProjectBbsDTO = sqlSession.getMapper(BeforeApprovalImpl.class).listView(idx);
      sqlSession.getMapper(BeforeApprovalImpl.class).visitcount(idx);
      model.addAttribute("ProjectBbsDTO", ProjectBbsDTO);
      //조회수 증가
      
      return "BeforeApprovalView";
   }

   // 글쓰기
   @RequestMapping("BeforeApprovalWriteController.do")
   public String BeforeApprovalWriteController(Model model, HttpServletRequest req, HttpSession session) {
      if (session.getAttribute("login") == null) {
         model.addAttribute("backUrl", "/ExchangeWrite");
         return "redirect:login.do";
      }

      return "BeforeApprovalWrite";
   }

   // 글쓰기처리
   @RequestMapping("BeforeApprovalWriteAction.do")
   public String BeforeApprovalWriteAction(Model model,  MultipartHttpServletRequest req) {
      
      
      MultipartFile mf = req.getFile("thumbnail"); //업로드 파라미터
      String path = req.getRealPath("../resources/thumbnail"); // 저장될 위치
      String thumbnail= mf.getOriginalFilename();//업로드 파일이름
      File uploadfile = new File(path+"//"+thumbnail);//복사될 위치
      
      try {
         mf.transferTo(uploadfile);//업로드
         
         
      }
      catch (IllegalStateException e) {
         e.printStackTrace();
      }
      catch (IOException e) {
         e.printStackTrace();
      }
      
/*      String result = saveFile(thumbnail);

      if (result != null) { // 파일 저장 성공
         model.addAttribute("result", result);
      } else { // 파일 저장 실패
         model.addAttribute("result", "fail");
      }*/
      
   
            
      ProjectBbsDTO beforeApproval = new ProjectBbsDTO();
      beforeApproval.setId(req.getParameter("id"));
      beforeApproval.setTitle(req.getParameter("title"));
      beforeApproval.setContent(req.getParameter("content"));
      beforeApproval.setThumbnail(thumbnail);
      beforeApproval.setM_limit(Integer.parseInt(req.getParameter("p_limit")));
      beforeApproval.setStart_date(req.getParameter("start_date"));
      beforeApproval.setEnd_date(req.getParameter("end_date"));
      beforeApproval.setAddress(req.getParameter("address"));

      ServletContext application = this.servletContext;

      sqlSession.getMapper(BeforeApprovalImpl.class).write(beforeApproval);

      return "redirect:BeforeApproval.do";
   }



   // 추천하기
   @RequestMapping("recommendAction")
   @ResponseBody
   public void recommendAction(@RequestParam("idx") String idx,@RequestParam("id") String id, HttpServletResponse resp) throws IOException {

      
      
      int recommend=sqlSession.getMapper(BeforeApprovalImpl.class).confirmrec(idx,id);
      System.out.println("recommend:"+recommend);
      
      if(recommend==0) {
         sqlSession.getMapper(BeforeApprovalImpl.class).recommendproc(idx);
         resp.getWriter().println("추천되었습니다.");
         
      }
      else {
         resp.getWriter().println("이미 추천하셨습니다.");
         
      }
   }

}