package model;


import java.sql.Date;

public class BeforeApprovalDTO {

	private int idx;
	private String id;
	private String title;
	private String content;
	private Date postdate;
	private int visit_count;
	private String cla_bbs;
	private int par_count;
	private Date start_date;
	private Date end_date;
	private int rec_count;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String attachedfile;
	private String thumbnail;
	
	
	
	public BeforeApprovalDTO() {}
	
	public BeforeApprovalDTO(int idx, String id, String title, String content, Date postdate, int visit_count,
			String cla_bbs, int par_count, Date start_date, Date end_date, int rec_count, int bgroup, int bstep,
			int bindent, String attachedfile,String thumbnail) {
		this.idx = idx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		this.visit_count = visit_count;
		this.cla_bbs = cla_bbs;
		this.par_count = par_count;
		this.start_date = start_date;
		this.end_date = end_date;
		this.rec_count = rec_count;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.attachedfile = attachedfile;
		
		
		
		
		
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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

	public int getVisit_count() {
		return visit_count;
	}

	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}

	public String getCla_bbs() {
		return cla_bbs;
	}

	public void setCla_bbs(String cla_bbs) {
		this.cla_bbs = cla_bbs;
	}

	public int getPar_count() {
		return par_count;
	}

	public void setPar_count(int par_count) {
		this.par_count = par_count;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public int getRec_count() {
		return rec_count;
	}

	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
	}

	public int getBgroup() {
		return bgroup;
	}

	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}

	public int getBstep() {
		return bstep;
	}

	public void setBstep(int bstep) {
		this.bstep = bstep;
	}

	public int getBindent() {
		return bindent;
	}

	public void setBindent(int bindent) {
		this.bindent = bindent;
	}

	public String getAttachedfile() {
		return attachedfile;
	}

	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}
	
	
	
}
