package com.devlink.msg;

public class Friend {
	private String frd_no;
	private String frd_name;
	
	public Friend() {}
	public Friend(String frd_no, String frd_name) {
		this.frd_no = frd_no;
		this.frd_name = frd_name;
	}
	public String getFrd_no() {
		return frd_no;
	}
	public void setFrd_no(String frd_no) {
		this.frd_no = frd_no;
	}
	public String getFrd_name() {
		return frd_name;
	}
	public void setFrd_name(String frd_name) {
		this.frd_name = frd_name;
	}
}
