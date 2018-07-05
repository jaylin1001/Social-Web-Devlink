package com.devlink.dao;

public class Frd {
	private String m_no;
	private String name;
	private String path;
	public String getM_no() {
		return m_no;
	}
	public Frd() {
		super();
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Frd(String m_no, String name, String path) {
		super();
		this.m_no = m_no;
		this.name = name;
		this.path = path;
	}
	@Override
	public String toString() {
		return "Frd [m_no=" + m_no + ", name=" + name + ", path=" + path + "]";
	}
	
}
