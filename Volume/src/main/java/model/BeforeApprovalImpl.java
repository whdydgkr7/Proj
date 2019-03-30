package model;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;


public interface BeforeApprovalImpl {

   //public ArrayList<ProjectBbsDTO> list();
   

   
   //수정하기폼
   public BeforeApprovalDTO view(String idx, String id);
   
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
   public ArrayList<ProjectBbsDTO> listPage(int s, int e);   
   
   
   //검색처리추가
   public int getTotalCountSearch(ParamDTO paramDTO);
   //start와 end를 파라미터로 받아 게시물 가져오기
   public ArrayList<ProjectBbsDTO> listPageSearch(ParamDTO paramDTO);

   //프로젝트게시판 상세보기
   public ProjectBbsDTO listView(String idx);


   //글쓰기
   public void write(ProjectBbsDTO beforeApproval);

   //조회수증가
   public void visitcount(String idx);


   //추천하기

   public int recommendproc(String idx);


   //추천중복확인
   public int confirmrec(String idx, String id);







   










   
}