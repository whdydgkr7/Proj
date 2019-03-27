package model;

import java.sql.Date;

public class OnedayDTO {

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
	private int e_limit;
	private String state;
	private int report_count;
	
	
	public OnedayDTO() {}


	public OnedayDTO(String idx, String id, String title, String content, String postdate, String start_date,
			String end_date, String address, String visit_count, String t_method, String t_time, String t_point,
			String attachedfile, String thumbnail, int e_limit, String state, int report_count) {
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
		this.state = state;
		this.report_count = report_count;
	}


	public String getIdx() {
		return idx;
	}


	public void setIdx(String idx) {
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


	public String getVisit_count() {
		return visit_count;
	}


	public void setVisit_count(String visit_count) {
		this.visit_count = visit_count;
	}


	public String getT_method() {
		return t_method;
	}


	public void setT_method(String t_method) {
		this.t_method = t_method;
	}


	public String getT_time() {
		return t_time;
	}


	public void setT_time(String t_time) {
		this.t_time = t_time;
	}


	public String getT_point() {
		return t_point;
	}


	public void setT_point(String t_point) {
		this.t_point = t_point;
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


	public int getE_limit() {
		return e_limit;
	}


	public void setE_limit(int e_limit) {
		this.e_limit = e_limit;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public int getReport_count() {
		return report_count;
	}


	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}


	
	

	
}
