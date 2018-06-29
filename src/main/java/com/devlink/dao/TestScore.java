package com.devlink.dao;

public class TestScore {
	private String no;
	private String title;
	private String score;
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
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public TestScore(String no, String title, String score) {
		super();
		this.no = no;
		this.title = title;
		this.score = score;
	}
	public TestScore() {
		super();
	}
	@Override
	public String toString() {
		return "TestScore [no=" + no + ", title=" + title + ", score=" + score + "]";
	}
	
}
