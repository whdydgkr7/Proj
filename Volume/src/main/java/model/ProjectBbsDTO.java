package model;


public class ProjectBbsDTO {

   private int idx;
   private String id;
   private String title;
   private String content;
   private String postdate;
   private String start_date;
   private String end_date;
   private String address;
   private int visit_count;
   private String attachedfile;
   private String thumbnail;
   private int m_limit;
   private int add_point;
   private String endbbs;
   private String state;
   private int recommend;
   
   public ProjectBbsDTO() {}


   public ProjectBbsDTO(int idx, String id, String title, String content, String postdate, String start_date,
         String end_date, String address, int visit_count, String attachedfile, String thumbnail, int m_limit,
         int add_point, String endbbs, String state, int recommend) {
      super();
      this.idx = idx;
      this.id = id;
      this.title = title;
      this.content = content;
      this.postdate = postdate;
      this.start_date = start_date;
      this.end_date = end_date;
      this.address = address;
      this.visit_count = visit_count;
      this.attachedfile = attachedfile;
      this.thumbnail = thumbnail;
      this.m_limit = m_limit;
      this.add_point = add_point;
      this.endbbs = endbbs;
      this.state = state;
      this.recommend = recommend;
   }




   public int getRecommend() {
      return recommend;
   }
   
   public void setRecommend(int recommend) {
      this.recommend = recommend;
   }





   public String getEndbbs() {
      return endbbs;
   }
   
   
   public void setEndbbs(String endbbs) {
      this.endbbs = endbbs;
   }
   
   
   public String getState() {
      return state;
   }
   
   
   public void setState(String state) {
      this.state = state;
   }



   public int getIdx() {
      return idx;
   }




   public void setIdx(int idx) {
      this.idx = idx;
   }




   public String getId() {
      return id;
   }




   public void setId(String id) {
      this.id = id;
   }




   public String getTitle() {
      return title;
   }




   public void setTitle(String title) {
      this.title = title;
   }




   public String getContent() {
      return content;
   }




   public void setContent(String content) {
      this.content = content;
   }




   public String getPostdate() {
      return postdate;
   }




   public void setPostdate(String postdate) {
      this.postdate = postdate;
   }




   public String getStart_date() {
      return start_date;
   }




   public void setStart_date(String start_date) {
      this.start_date = start_date;
   }




   public String getEnd_date() {
      return end_date;
   }




   public void setEnd_date(String end_date) {
      this.end_date = end_date;
   }




   public String getAddress() {
      return address;
   }




   public void setAddress(String address) {
      this.address = address;
   }




   public int getVisit_count() {
      return visit_count;
   }




   public void setVisit_count(int visit_count) {
      this.visit_count = visit_count;
   }




   public String getAttachedfile() {
      return attachedfile;
   }




   public void setAttachedfile(String attachedfile) {
      this.attachedfile = attachedfile;
   }




   public String getThumbnail() {
      return thumbnail;
   }




   public void setThumbnail(String thumbnail) {
      this.thumbnail = thumbnail;
   }




   public int getM_limit() {
      return m_limit;
   }




   public void setM_limit(int m_limit) {
      this.m_limit = m_limit;
   }




   public int getAdd_point() {
      return add_point;
   }




   public void setAdd_point(int add_point) {
      this.add_point = add_point;
   }



   
   
   
}