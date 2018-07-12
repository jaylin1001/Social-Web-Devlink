package com.devlink.dao;

import java.util.ArrayList;

public class HomeContents {
	private String doc_num;
	private String m_no;
	private String m_name;
	private String title;
	private String date;
	private String contents;
	private String editor;
	private String doc_kind;
	private String level;
	private String open_range;
	private String cmt;
	private String cmt_level;
	private String path;
	public String getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(String doc_num) {
		this.doc_num = doc_num;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getDoc_kind() {
		return doc_kind;
	}
	public void setDoc_kind(String doc_kind) {
		this.doc_kind = doc_kind;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getOpen_range() {
		return open_range;
	}
	public void setOpen_range(String open_range) {
		this.open_range = open_range;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "HomeContents [doc_num=" + doc_num + ", m_no=" + m_no + ", m_name=" + m_name + ", title=" + title
				+ ", date=" + date + ", contents=" + contents + ", editor=" + editor + ", doc_kind=" + doc_kind
				+ ", level=" + level + ", open_range=" + open_range + ", cmt=" + cmt + ", cmt_level=" + cmt_level
				+ ", path=" + path + "]";
	}
	public HomeContents(String doc_num, String m_no, String m_name, String title, String date, String contents,
			String editor, String doc_kind, String level, String open_range, String cmt, String cmt_level,
			String path) {
		super();
		this.doc_num = doc_num;
		this.m_no = m_no;
		this.m_name = m_name;
		this.title = title;
		this.date = date;
		this.contents = contents;
		this.editor = editor;
		this.doc_kind = doc_kind;
		this.level = level;
		this.open_range = open_range;
		this.cmt = cmt;
		this.cmt_level = cmt_level;
		this.path = path;
	}
	public HomeContents() {
		super();
	}

}
