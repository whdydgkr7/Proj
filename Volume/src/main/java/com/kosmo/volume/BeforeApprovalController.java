package com.kosmo.volume;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;


import model.BeforeApprovalDTO;
import model.BeforeApprovalImpl;
import model.PagingUtil;
import model.ParamDTO;

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
		int pageSize = 10;
		int blockPage = 5;

		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

		// 시작 및 끝 rownum 구하기
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		// 검색처리를 위한 추가부분
		paramDTO.setStart(start);
		paramDTO.setEnd(end);

		/* Mybatis 이용 */
		ArrayList<BeforeApprovalDTO> lists = sqlSession.getMapper(BeforeApprovalImpl.class).listPageSearch(paramDTO);

		// 페이지 처리
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/BeforeApproval.do?" + addQueryString);

		model.addAttribute("pagingImg", pagingImg);

		// 줄바꿈처리
		for (BeforeApprovalDTO dto : lists) {
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
		BeforeApprovalDTO beforeApprovalDTO = new BeforeApprovalDTO();

		beforeApprovalDTO = sqlSession.getMapper(BeforeApprovalImpl.class).listView(idx);
		model.addAttribute("beforeApprovalDTO", beforeApprovalDTO);

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
		
/*		String result = saveFile(thumbnail);

		if (result != null) { // 파일 저장 성공
			model.addAttribute("result", result);
		} else { // 파일 저장 실패
			model.addAttribute("result", "fail");
		}*/
		
	
				
		BeforeApprovalDTO beforeApproval = new BeforeApprovalDTO();
		beforeApproval.setId(req.getParameter("id"));
		beforeApproval.setTitle(req.getParameter("title"));
		beforeApproval.setContent(req.getParameter("content"));
		beforeApproval.setThumbnail(thumbnail);
		beforeApproval.setP_limit(Integer.parseInt(req.getParameter("p_limit")));
		beforeApproval.setStart_date(req.getParameter("start_date"));
		beforeApproval.setEnd_date(req.getParameter("end_date"));
		beforeApproval.setAddress(req.getParameter("address"));

		ServletContext application = this.servletContext;

		sqlSession.getMapper(BeforeApprovalImpl.class).write(beforeApproval);

		return "redirect:BeforeApproval.do";
	}

/*	private String saveFile(MultipartFile file) {
			
		

		final String UPLOAD_PATH =  "/Volume/src/main/webapp/resources/thumbnail";

		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();

		File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더이름, 저장할 파일 이름

		try {
			file.transferTo(saveFile); // 업로드 파일에 saveFile 이라는 껍데기 익힘
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
	}*/

	// 추천하기
	@RequestMapping("recommendAction.do")
	public String recommendAction(Model model, HttpSession session, HttpServletRequest req) {
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("propose_idx:" + idx);
		sqlSession.getMapper(BeforeApprovalImpl.class).recommendAction(idx);

		return "redirect:BeforeApproval.do";
	}

}
