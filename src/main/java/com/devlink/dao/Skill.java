package com.devlink.dao;

public class Skill {
	private String no;
	private String title;
	private String level;
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
	public Skill(String no, String title, String level) {
		super();
		this.no = no;
		this.title = title;
		this.level = level;
	}
	public Skill() {
		super();
	}
	@Override
	public String toString() {
		return "Skill [no=" + no + ", title=" + title + ", level=" + level + "]";
	}
	
}
