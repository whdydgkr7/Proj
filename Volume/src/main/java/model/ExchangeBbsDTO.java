package model;

import java.sql.Date;

public class ExchangeBbsDTO {

	private String idx;
	private String id;
	private String title;
	private String content;
	private String postdate;
	private String start_date;
	private String end_date;
	private String address;
	private String visit_count;
	private String t_method;
	private String t_time;
	private String t_point;
	private String attachedfile;
	private String thumbnail;
	private String e_limit;
	
	
	public ExchangeBbsDTO() {}


	public ExchangeBbsDTO(String idx, String id, String title, String content, String postdate, String start_date,
			String end_date, String address, String visit_count, String t_method, String t_time, String t_point,
			String attachedfile, String thumbnail, String e_limit) {
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
		this.t_method = t_method;
		this.t_time = t_time;
		this.t_point = t_point;
		this.attachedfile = attachedfile;
		this.thumbnail = thumbnail;
		this.e_limit = e_limit;
	}


	public String getIdx() {
		return idx;
	}


	public String getId() {
		return id;
	}


	public String getTitle() {
		return title;
	}


	public String getContent() {
		return content;
	}


	public String getPostdate() {
		return postdate;
	}


	public String getStart_date() {
		return start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public String getAddress() {
		return address;
	}


	public String getVisit_count() {
		return visit_count;
	}


	public String getT_method() {
		return t_method;
	}


	public String getT_time() {
		return t_time;
	}


	public String getT_point() {
		return t_point;
	}


	public String getAttachedfile() {
		return attachedfile;
	}


	public String getThumbnail() {
		return thumbnail;
	}


	public String getE_limit() {
		return e_limit;
	}


	public void setIdx(String idx) {
		this.idx = idx;
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setVisit_count(String visit_count) {
		this.visit_count = visit_count;
	}


	public void setT_method(String t_method) {
		this.t_method = t_method;
	}


	public void setT_time(String t_time) {
		this.t_time = t_time;
	}


	public void setT_point(String t_point) {
		this.t_point = t_point;
	}


	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}


	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}


	public void setE_limit(String e_limit) {
		this.e_limit = e_limit;
	}
	
}
