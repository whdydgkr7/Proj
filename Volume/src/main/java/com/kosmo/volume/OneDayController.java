package com.kosmo.volume;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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

import model.BeforeApprovalImpl;
import model.OnedayDTO;
import model.OnedayImpl;
import model.PagingUtil;
import model.ParamDTO;
import model.ProjectBbsDAOImpl;
import model.ProjectBbsDTO;

@Controller
public class OneDayController {
	

	@Autowired
	SqlSession sqlSession;

	@Autowired
	ServletContext servletContext;
	
	
	@RequestMapping("/oneDay")
	public String oneDay(Model model ,HttpServletRequest req) {
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
		int totalRecordCount = sqlSession.getMapper(OnedayImpl.class).getTotalCount();
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
		ArrayList<OnedayDTO> lists = sqlSession.getMapper(OnedayImpl.class).listPageSearch(paramDTO);

		// 페이지 처리
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/BeforeApproval.do?" + addQueryString);

		model.addAttribute("pagingImg", pagingImg);

		// 줄바꿈처리
		for (OnedayDTO dto : lists) {
			String temp = dto.getContent().replace("\r\n", "<br/>");
			dto.setContent(temp);

		}
		model.addAttribute("lists", lists);
		
		return "OneDay";
	}
	
	// 상세보기
	@RequestMapping("OndayViewController.do")
	public String PrjectBbsView(Model model, HttpServletRequest req) {
		String idx = req.getParameter("idx");
		OnedayDTO onedayDTO = new OnedayDTO();
		
        String num = sqlSession.getMapper(OnedayImpl.class).selectbbs(idx);
        if(!(num==null || num.equals(""))) {
       	 model.addAttribute("num",num);
        }
		
		
        sqlSession.getMapper(OnedayImpl.class).visit(idx);
		onedayDTO = sqlSession.getMapper(OnedayImpl.class).exView(idx);
		model.addAttribute("onedayDTO", onedayDTO);

		return "OnedayView";
	}	
	// 글쓰기
	@RequestMapping("OnedayWriteController.do")
	public String OnedayWriteController(Model model, HttpServletRequest req, HttpSession session) {
		if (session.getAttribute("login") == null) {
			model.addAttribute("backUrl", "/OnedayWrite");
			return "redirect:login.do";
		}

		return "OnedayWrite";
	}	
	
	
	//글쓰기 처리
	@RequestMapping("OnedayWriteAction.do")
	public String OnedayWriteAction(Model model,  MultipartHttpServletRequest req) {
		
		
		MultipartFile mf = req.getFile("thumbnail"); //업로드 파라미터
		String path = req.getRealPath("./resources/thumbnail"); // 저장될 위치
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

		String t_time = req.getParameter("start_time")+"~"+req.getParameter("end_time");
		String state="wait";
				
		OnedayDTO onedayDTO = new OnedayDTO();
		onedayDTO.setId(req.getParameter("id"));
		onedayDTO.setTitle(req.getParameter("title"));
		onedayDTO.setContent(req.getParameter("content"));
		onedayDTO.setThumbnail(thumbnail);
		onedayDTO.setE_limit(Integer.parseInt(req.getParameter("e_limit")));
		onedayDTO.setStart_date(req.getParameter("start_date"));
		onedayDTO.setT_time(t_time);
		onedayDTO.setState(state);
		onedayDTO.setAddress(req.getParameter("address"));
		onedayDTO.setT_point(req.getParameter("t_point"));
		onedayDTO.setT_method(req.getParameter("t_method"));

		ServletContext application = this.servletContext;

		sqlSession.getMapper(OnedayImpl.class).write(onedayDTO);

		return "redirect:oneDay";
	}
	
	//수강신청
    @RequestMapping("joinClass")
    @ResponseBody
    public void join(@RequestParam("idx") String idx,@RequestParam("id") String id, HttpServletResponse resp) throws IOException {
  	  resp.setContentType("text/html;charset=UTF-8");
  	  System.out.println("id1111:"+id);
  	  System.out.println("idx1111:"+idx);
  	  
        String joinMessage="";
        int canjoin =sqlSession.getMapper(OnedayImpl.class).confirmjoin(idx,id);
     
        System.out.println("onedayclassjoin:"+canjoin);
        if(canjoin==0) {
      	  sqlSession.getMapper(OnedayImpl.class).join(idx,id);
	        	  resp.getWriter().println("참가신청되었습니다.");
	        	  
      	  
        }
        else {
      	  resp.getWriter().println("이미 참가신청하셨습니다.");
      	  //return joinMessage;
        
        
        }
    }
    
    
    //원데이클래스 캘린더
    @RequestMapping("Calendar2.do")
    public String fullcalendar (Model model) {
       
       
       return "fullcalendarView2";
    }
    
    
    @RequestMapping(value="/CalendarView2.do")
     @ResponseBody
     public ArrayList<OnedayDTO> projectBbsView(Model model, HttpServletRequest req){
       ArrayList<OnedayDTO> list = new ArrayList<OnedayDTO>();
       
       ArrayList<OnedayDTO> clist= sqlSession.getMapper(OnedayImpl.class).clist();
       

       if(clist==null) {
       }
       else {
          list.addAll(clist);
          
       }
         return list;
     }   

}
