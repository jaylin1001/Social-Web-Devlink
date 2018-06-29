package com.devlink.dao;

public class Exp {
	private String no;
	private String title;
	private String start;
	private String end;
	private String duration;
	private String group;
	private String place;
	private String contents;
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
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Exp(String no, String title, String start, String end, String duration, String group, String place,
			String contents) {
		super();
		this.no = no;
		this.title = title;
		this.start = start;
		this.end = end;
		this.duration = duration;
		this.group = group;
		this.place = place;
		this.contents = contents;
	}
	public Exp() {
		super();
	}
	@Override
	public String toString() {
		return "Exp [no=" + no + ", title=" + title + ", start=" + start + ", end=" + end + ", duration=" + duration
				+ ", group=" + group + ", place=" + place + ", contents=" + contents + "]";
	}
	
	
}
