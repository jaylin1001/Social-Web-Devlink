package com.devlink.dao;

public class Search {
	private String nm_no;
	private String nm;
	private String nm_div;
	private String m_no;
	public String getNm_no() {
		return nm_no;
	}
	public void setNm_no(String nm_no) {
		this.nm_no = nm_no;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getNm_div() {
		return nm_div;
	}
	public void setNm_div(String nm_div) {
		this.nm_div = nm_div;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public Search(String nm_no, String nm, String nm_div, String m_no) {
		super();
		this.nm_no = nm_no;
		this.nm = nm;
		this.nm_div = nm_div;
		this.m_no = m_no;
	}
	@Override
	public String toString() {
		return "Search [nm_no=" + nm_no + ", nm=" + nm + ", nm_div=" + nm_div + ", m_no=" + m_no + "]";
	}
	public Search() {
		super();
	}
	
	
}
