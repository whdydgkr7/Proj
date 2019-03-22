package model;

import java.sql.Date;

public class PcommentDTO {
   
   private int comment_idx;
   private int idx;
   private String id;
   private String content;
   private Date postdate;
   
   public PcommentDTO() {}

   public PcommentDTO(int comment_idx, int idx, String id, String content, Date postdate) {
      super();
      this.comment_idx = comment_idx;
      this.idx = idx;
      this.id = id;
      this.content = content;
      this.postdate = postdate;
   }

   public int getComment_idx() {
      return comment_idx;
   }

   public void setComment_idx(int comment_idx) {
      this.comment_idx = comment_idx;
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
   
   
   
   
}