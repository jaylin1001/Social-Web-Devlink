package com.devlink.dao;

public class Member {
	private String m_no;
	private String id;
	private String pwd;
	private String joindate;
	private String outdate;
	private String name;
	private String address;
	private String email;
	private String phone;
	private String headline;
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getOutdate() {
		return outdate;
	}
	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public Member(String m_no, String id, String pwd, String joindate, String outdate, String name, String address,
			String email, String phone, String headline) {
		super();
		this.m_no = m_no;
		this.id = id;
		this.pwd = pwd;
		this.joindate = joindate;
		this.outdate = outdate;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.headline = headline;
	}
	public Member() {
		super();
	}
	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", id=" + id + ", pwd=" + pwd + ", joindate=" + joindate + ", outdate="
				+ outdate + ", name=" + name + ", address=" + address + ", email=" + email + ", phone=" + phone
				+ ", headline=" + headline + "]";
	}
	
}
