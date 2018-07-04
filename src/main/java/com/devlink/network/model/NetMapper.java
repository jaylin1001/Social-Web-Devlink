package com.devlink.network.model;

import java.util.ArrayList;

import com.devlink.dao.Member;

public interface NetMapper {
	ArrayList<Member> selectFrdTo(String no);
	ArrayList<Member> selectFrdFrom(String no);
	ArrayList<Member> selectFrdP(String no);
}