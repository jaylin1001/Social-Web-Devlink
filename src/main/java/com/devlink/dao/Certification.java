package com.devlink.dao;

public class Certification {
	private String no;
	private String title;
	private String contents;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Certification(String no, String title, String contents) {
		super();
		this.no = no;
		this.title = title;
		this.contents = contents;
	}
	public Certification() {
		super();
	}
	@Override
	public String toString() {
		return "Certification [no=" + no + ", title=" + title + ", contents=" + contents + "]";
	}
	
	
}
