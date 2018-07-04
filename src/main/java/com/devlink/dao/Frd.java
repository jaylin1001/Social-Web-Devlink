package com.devlink.dao;

public class Frd {
	private String no;
	private String from;
	private String to;
	private String status;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Frd [no=" + no + ", from=" + from + ", to=" + to + ", status=" + status + "]";
	}
	public Frd(String no, String from, String to, String status) {
		super();
		this.no = no;
		this.from = from;
		this.to = to;
		this.status = status;
	}
	public Frd() {
		super();
	}
	
	
}
