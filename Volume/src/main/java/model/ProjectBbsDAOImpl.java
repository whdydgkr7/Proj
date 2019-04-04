package model;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import user.UserDTO;

public interface ProjectBbsDAOImpl {

   public ArrayList<ProjectBbsDTO> list();

   // 글쓰기
   public void write(String name, String contents, String id);

   // 수정하기폼
   public ProjectBbsDTO view(String idx, String id);

   // 수정처리
   /*
    * public int modify(String idx, String name, String contents, String id);
    */
   public int modify(@Param("_idx") String idx, @Param("_name") String name, @Param("_contents") String contents,
         @Param("_id") String id);

   // 삭제처리
   public int delete(String idx, String id);

   // 게시판 리스트 페이지 처리
   // 게시물 카운트
   public int getTotalCount();

   // start와 end를 파라미터로 받아 게시물 가져오기
   public ArrayList<ProjectBbsDTO> listPage(int s, int e);

   // 검색처리추가
   public int getTotalCountSearch(ParamDTO paramDTO);

   // start와 end를 파라미터로 받아 게시물 가져오기
   public ArrayList<ProjectBbsDTO> listPageSearch(ParamDTO paramDTO);

   // 캘린더에서 DB 불러오기
   public ArrayList<ProjectBbsDTO> clist();

   // 프로젝트게시판 상세보기
   public ProjectBbsDTO listView(String idx);

   // 댓글
   public void pcomment(PcommentDTO pDTO);

   public ArrayList<PcommentDTO> viewcommend(String idx);

   public void cdelete(String idx, String cidx);

   // 조회수증가
   public void visitcount(String idx);

   // 댓글수,리뷰수
   public ArrayList<PcommentDTO> pcCount(String idx);

   public ArrayList<ReviewDTO> reviewCount(String idx);

   public ArrayList<ProjectBbsDTO> mainpbbs();

   //참가가능여부 확인(아이디,아이디엑스 확인)
   public int confirmjoin(String idx, String id);

   //참가하기
   public void join(String idx, String id);

   public int procjoin();

   public String selectbbs(String idx);
   
   //마이페이지 - 내가제안한 프로젝트 셀랙
   public ArrayList<ProjectBbsDTO> mybbs(String id);
   
   //포인트증가를위한 아이디저장
   public ArrayList<UserDTO> userPoint(String idx);

   //포인트지급완료후(진행중에서제거)
   public void state(String idx);
   //댓글수 카운트
   public int ccount(String idx);
   

}