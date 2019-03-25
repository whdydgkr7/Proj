package model;

import java.sql.Date;

public class ReviewDTO {

   private int review_idx;
   private int idx;
   private String id;
   private String title;
   private String content;
   private Date postdate;
   private String attachedfile;
   
   public ReviewDTO() {}
   
   public ReviewDTO(int review_idx, int idx, String id, String title, String content, Date postdate,
         String attachedfile) {
      super();
      this.review_idx = review_idx;
      this.idx = idx;
      this.id = id;
      this.title = title;
      this.content = content;
      this.postdate = postdate;
      this.attachedfile = attachedfile;
   }

   public int getReview_idx() {
      return review_idx;
   }

   public void setReview_idx(int review_idx) {
      this.review_idx = review_idx;
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

   public Date getPostdate() {
      return postdate;
   }

   public void setPostdate(Date postdate) {
      this.postdate = postdate;
   }

   public String getAttachedfile() {
      return attachedfile;
   }

   public void setAttachedfile(String attachedfile) {
      this.attachedfile = attachedfile;
   }
   
   
   
   
}