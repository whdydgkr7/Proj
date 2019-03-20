package model;


import java.sql.Date;

public class ProjectBbsDTO {

	private int idx;
	private String id;
	private String title;
	private String content;
	private Date postdate;
	private Date start_date;
	private Date end_date;
	private String address;
	private int visit_count;
	private String attachedfile;
	private String thumbnail;
	private int m_limit;
	private int add_point;
	private int rec_count;
	
	
	
	public ProjectBbsDTO() {}


	public ProjectBbsDTO(int idx, String id, String title, String content, Date postdate, Date start_date,
			Date end_date, String address, int visit_count, String attachedfile, String thumbnail, int m_limit,
			int add_point, int rec_count) {
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
		this.rec_count = rec_count;
	}










	public int getRec_count() {
		return rec_count;
	}



	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
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