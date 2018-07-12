package com.devlink.msg;

public class Message {
	private String msg_from;
	private String msg_to;
	private String msg_date;
	private String msg;
	
	public Message() {}

	public Message(String msg_from, String msg_to, String msg_date, String msg) {
		this.msg_from = msg_from;
		this.msg_to = msg_to;
		this.msg_date = msg_date;
		this.msg = msg;
	}

	public String getMsg_from() {
		return msg_from;
	}

	public void setMsg_from(String msg_from) {
		this.msg_from = msg_from;
	}

	public String getMsg_to() {
		return msg_to;
	}

	public void setMsg_to(String msg_to) {
		this.msg_to = msg_to;
	}

	public String getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
