package com.devlink.network.model;

import java.util.ArrayList;

import com.devlink.dao.Frd;

public interface NetMapper {
	ArrayList<Frd> selectFrdTo(String no);
	ArrayList<Frd> selectFrdFrom(String no);
	ArrayList<Frd> selectFrdP(String no);
	ArrayList<Frd> selectFrd(String no);
	ArrayList<Frd> selectFrdAll(String no);
}