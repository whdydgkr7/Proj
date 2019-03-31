package model;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;


public interface OnedayImpl {

	public ArrayList<ProjectBbsDTO> list();
	

	
	//수정하기폼
	public OnedayDTO view(String idx, String id);
	
	//수정처리
	/*public int modify(String idx, String name, 
			String contents, String id);*/
	public int modify(@Param("_idx") String idx, 
			@Param("_name") String name, 
			@Param("_contents") String contents, 
			@Param("_id") String id);
	
	//삭제처리
	public int delete(String idx, String id);
	
	
	//게시판 리스트 페이지 처리
	//게시물 카운트
	public int getTotalCount();
	//start와 end를 파라미터로 받아 게시물 가져오기
	public ArrayList<OnedayDTO> listPage(int s, int e);	
	
	
	//검색처리추가
	public int getTotalCountSearch(ParamDTO paramDTO);
	//start와 end를 파라미터로 받아 게시물 가져오기
	public ArrayList<OnedayDTO> listPageSearch(ParamDTO paramDTO);

	//게시판 상세보기
	public OnedayDTO exView(String idx);


	//글쓰기
	public void write(OnedayDTO onedayDTO);




	//추천하기
	public void recommendAction(int idx);



	public ArrayList<OnedayDTO> mainebbs();
	public int confirmjoin(String idx, String id);

	public void join(String idx, String id);

	public String selectbbs(String idx);

	public ArrayList<OnedayDTO> clist();

	//조회수증가
	public void visit(String idx);



	




	










	
}
