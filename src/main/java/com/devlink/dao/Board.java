package com.devlink.dao;

public class Board {
	private String b_no;
	private String b_title;
	private String m_no;
	private String b_date;
	private String b_contents;
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_contents() {
		return b_contents;
	}
	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}
	@Override
	public String toString() {
		return "Board [b_no=" + b_no + ", b_title=" + b_title + ", m_no=" + m_no + ", b_date=" + b_date
				+ ", b_contents=" + b_contents + "]";
	}
	public Board(String b_no, String b_title, String m_no, String b_date, String b_contents) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.m_no = m_no;
		this.b_date = b_date;
		this.b_contents = b_contents;
	}
	public Board() {
		super();
	}
	
	
}
