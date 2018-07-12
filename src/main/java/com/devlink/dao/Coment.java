package com.devlink.dao;

public class Coment {
	private String doc_num;
	private String w_no;
	private String cmt;
	private String cmt_level;
	
	
	public Coment() {
		super();
	}
	
	public Coment(String doc_num, String w_no, String cmt, String cmt_level) {
		super();
		this.doc_num = doc_num;
		this.w_no = w_no;
		this.cmt = cmt;
		this.cmt_level = cmt_level;
	}

	public String getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(String doc_num) {
		this.doc_num = doc_num;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public String getCmt_level() {
		return cmt_level;
	}
	public void setCmt_level(String cmt_level) {
		this.cmt_level = cmt_level;
	}
	
	public String getW_no() {
		return w_no;
	}

	public void setW_no(String w_no) {
		this.w_no = w_no;
	}

	@Override
	public String toString() {
		return "Coment [doc_num=" + doc_num + ", w_no=" + w_no + ", cmt=" + cmt + ", cmt_level=" + cmt_level + "]";
	}

}
