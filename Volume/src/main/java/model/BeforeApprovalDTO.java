package model;

import java.sql.Date;

public class BeforeApprovalDTO {
	
	private int propose_idx;
	private String id;
	private String content;
	private Date postdate;
	private int visit_count;
	private int recommend;
	private String title;
	private String start_date;
	private String end_date;
	private int p_limit;
	private String thumbnail;
	private String attachedfile;
	private String address;
	private String state;
	private int add_point;
	
	

	public BeforeApprovalDTO() {}



	public BeforeApprovalDTO(int propose_idx, String id, String content, Date postdate, int visit_count, int recommend,
			String title, String start_date, String end_date, int p_limit, String thumbnail, String attachedfile,
			String address, String state, int add_point) {
		this.propose_idx = propose_idx;
		this.id = id;
		this.content = content;
		this.postdate = postdate;
		this.visit_count = visit_count;
		this.recommend = recommend;
		this.title = title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.p_limit = p_limit;
		this.thumbnail = thumbnail;
		this.attachedfile = attachedfile;
		this.address = address;
		this.state = state;
		this.add_point = add_point;
	}



	public int getPropose_idx() {
		return propose_idx;
	}



	public void setPropose_idx(int propose_idx) {
		this.propose_idx = propose_idx;
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



	public int getVisit_count() {
		return visit_count;
	}



	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}



	public int getRecommend() {
		return recommend;
	}



	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
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



	public int getP_limit() {
		return p_limit;
	}



	public void setP_limit(int p_limit) {
		this.p_limit = p_limit;
	}



	public String getThumbnail() {
		return thumbnail;
	}



	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}



	public String getAttachedfile() {
		return attachedfile;
	}



	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public int getAdd_point() {
		return add_point;
	}



	public void setAdd_point(int add_point) {
		this.add_point = add_point;
	}

	


	

}