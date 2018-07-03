package com.devlink.dao;

import org.springframework.web.multipart.MultipartFile;

public class Img {
	private String no;
	private String path;
	private MultipartFile file;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "Img [no=" + no + ", path=" + path + ", file=" + file + "]";
	}
	public Img(String no, String path, MultipartFile file) {
		super();
		this.no = no;
		this.path = path;
		this.file = file;
	}
	public Img() {
		super();
	}
	
	
}
