package com.kosmo.volume;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.OnedayDTO;
import model.OnedayImpl;
import model.ProjectBbsDAOImpl;
import model.ProjectBbsDTO;
import myPage.MyPageImpl;
import user.UserDTO;
import user.UserImpl;

@Controller
public class MyPageController {

   @Autowired
   private SqlSession sqlSession;

   @RequestMapping("/MyPage")
   public String Mypage(Model model, HttpServletRequest req) {

      return "MyPage/MyPageMain";
   }

   @RequestMapping("/MyPageProjView")
   @ResponseBody
   public ArrayList<ProjectBbsDTO> myPageProjView(Model model, HttpServletRequest req) {
      ArrayList<ProjectBbsDTO> list = sqlSession.getMapper(MyPageImpl.class).ViewProj(req.getParameter("id"));
      return list;
   }

   @RequestMapping("/MyInfo.do")
   public String MyInfo(HttpSession session, Model model) {

      UserDTO login = (UserDTO) session.getAttribute("login");

      model.addAttribute("login", login);

      return "MyPage/MyInforView";
   }

   @RequestMapping("/modifiAction.do")
   public String ModifiAction(HttpSession session, Model model, HttpServletRequest req) {

      UserDTO login = (UserDTO) session.getAttribute("login");

      model.addAttribute("login", login);

      return "MyPage/MyInformodifi";
   }

   @RequestMapping("/modifityAction.do")
   public String modifityAction(HttpSession session, Model model, HttpServletRequest req) {
      String id = req.getParameter("id");
      String pass = req.getParameter("pass");
      String email = req.getParameter("email");
      String name = req.getParameter("name");

      System.out.println("1" + id);
      System.out.println("2" + pass);
      System.out.println("3" + email);
      System.out.println("4" + name);

      sqlSession.getMapper(UserImpl.class).Modifi(name, email, pass, id);

      return "redirect:/loginAction?id=" + id + "&pass=" + pass;
   }

   @RequestMapping("/MyTakeProject.do")
   public String MyTakeProject(Model model) {
      return "MyPage/MyTakeProject";
   }

   // 내가 제안한 프로젝트
   @RequestMapping("/MyOfferProject.do")
   public String MyOfferProject(Model model, HttpServletRequest req) {
      
      String id = req.getParameter("user_id");
      System.out.println("id"+id);
      /* Mybatis 이용 */
      ArrayList<ProjectBbsDTO> lists = sqlSession.getMapper(ProjectBbsDAOImpl.class).mybbs(id);
      
      System.out.println("sdajsadljasd"+lists.size());
      // 줄바꿈처리
      for (ProjectBbsDTO dto : lists) {
         String temp = dto.getContent().replace("\r\n", "<br/>");
         dto.setContent(temp);

      }

      model.addAttribute("lists", lists);

      return "MyPage/MyOfferProject";
   }

   @RequestMapping("/MyOneDayClass.do")
   public String MyOneDayClass(Model model, HttpServletRequest req) {
      
      String id = req.getParameter("user_id");
      System.out.println("id"+id);
      ArrayList<OnedayDTO> lists = sqlSession.getMapper(OnedayImpl.class).myoneDay(id);
      
      System.out.println("sdajsadljasd"+lists.size());
      // 줄바꿈처리
      for (OnedayDTO dto : lists) {
         String temp = dto.getContent().replace("\r\n", "<br/>");
         dto.setContent(temp);

      }

      model.addAttribute("lists", lists);
      
      return "MyPage/MyOneDayClass";
   }

   @RequestMapping("/MyProjectLatter.do")
   public String MyProjectLatter(Model model) {
      return "MyPage/MyProjectLatter";
   }

}