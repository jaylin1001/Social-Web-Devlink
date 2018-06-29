package com.devlink.dao;

public class Language {
	private String no;
	private String title;
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
	public Language(String no, String title) {
		super();
		this.no = no;
		this.title = title;
	}
	public Language() {
		super();
	}
	@Override
	public String toString() {
		return "Language [no=" + no + ", title=" + title + "]";
	}
	
}
