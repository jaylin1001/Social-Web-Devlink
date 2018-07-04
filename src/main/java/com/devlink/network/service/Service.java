package com.devlink.network.service;

import java.util.ArrayList;

import com.devlink.dao.Member;

public interface Service {
	ArrayList<Member> getFrdTo(String no);
	ArrayList<Member> getFrdFrom(String no);
	ArrayList<Member> getFrdP(String no);
}
