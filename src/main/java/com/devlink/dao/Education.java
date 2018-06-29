package com.devlink.dao;

public class Education {
	private String no;
	private String title;
	private String degree;
	private String contents;
	private String start;
	private String end;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "Education [no=" + no + ", title=" + title + ", degree=" + degree + ", contents=" + contents + ", start="
				+ start + ", end=" + end + "]";
	}
	public Education(String no, String title, String degree, String contents, String start, String end) {
		super();
		this.no = no;
		this.title = title;
		this.degree = degree;
		this.contents = contents;
		this.start = start;
		this.end = end;
	}
	public Education() {
		super();
	}
	
}
