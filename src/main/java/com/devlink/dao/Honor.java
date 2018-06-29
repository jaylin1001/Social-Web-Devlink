package com.devlink.dao;

public class Honor {
	private String no;
	private String title;
	private String level;
	private String year;
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
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Honor(String no, String title, String level, String year) {
		super();
		this.no = no;
		this.title = title;
		this.level = level;
		this.year = year;
	}
	public Honor() {
		super();
	}
	@Override
	public String toString() {
		return "Honor [no=" + no + ", title=" + title + ", level=" + level + ", year=" + year + "]";
	}
	
	
}
