package com.kosmo.volume;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.ExchangeBbsDAOImpl;
import model.ExchangeBbsDTO;
import model.PagingUtil;
import model.ParamDTO;


@Controller
public class ExchangeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/Exchangelist.do")
	public String ExchangeBbs(Model model, HttpServletRequest req) {
		
		ParamDTO paramDTO = new ParamDTO();
		String addQueryString = "";
		String keyField = req.getParameter("keyField");
		String keyString = req.getParameter("keyString");
		if(keyString!=null) {
			addQueryString = String.format("keyField=%s&keyString=%s&", keyField,keyString);
			
			paramDTO.setKeyField(keyField);
			paramDTO.setKeyString(keyString);
		}
		
		int totalRecordCount = sqlSession.getMapper(ExchangeBbsDAOImpl.class).getTotalCountSearch(paramDTO);
		System.out.println("totalRecordCount=" + totalRecordCount);
		
		//페이지 처리를 위한 설정값
				int pageSize = 4;
				int blockPage = 2;
				
				//전체페이지수계산하기
				int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
				
				//시작 및 끝 rownum 구하기
				int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
				int start = (nowPage-1) * pageSize + 1;
				int end = nowPage * pageSize;
				
				//검색처리위한 추가부분
				paramDTO.setStart(start);
				paramDTO.setEnd(end);
				
				ArrayList<ExchangeBbsDTO> lists = sqlSession.getMapper(ExchangeBbsDAOImpl.class).listPageSearch(paramDTO);//if문 사용
						//.listPageSearch2(paramDTO);//choose문 사용
				
				//페이지 처리를 위한 처리부분
				String pagingImg = PagingUtil.pagingImg(totalRecordCount,pageSize, blockPage, nowPage,
						req.getContextPath()+"/Exchangelist.do?" + addQueryString );
				model.addAttribute("pagingImg" , pagingImg);
				
				for(ExchangeBbsDTO dto : lists) {
					String temp = dto.getContent().replace("\r\n", "<br/>");
					dto.setContent(temp);
				}
				model.addAttribute("lists",lists);
				return "ExchangeBbs";
		
	
	}
	/*@RequestMapping("/Exchangeview.do")
	public String Exchangeview(Model model, HttpServletRequest req) {
		
		
	}*/
	
}
