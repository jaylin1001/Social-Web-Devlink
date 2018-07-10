package com.devlink.network.service;

import java.util.ArrayList;

import com.devlink.dao.Frd;

public interface Service {
	ArrayList<Frd> getFrdTo(String no);
	ArrayList<Frd> getFrdFrom(String no);
	ArrayList<Frd> getFrdP(String no);
	ArrayList<Frd> getFrd(String no);
	ArrayList<Frd> getFrdAll(String no);
	String getIngFrdNo(String myno, String no);
	void delFrdFrom(String frdNo);
	String isFrd(String myno, String no);
	void frdtoOk(String frdNo);
	void addFrdReq(String myno, String no);
	void delFrdReq(String myno, String no);
	String getIngFrdToMeNo(String myno, String no);
	String getFrdFromMeNo(String myno, String no);
	void delFrd(String myno, String no);
}
