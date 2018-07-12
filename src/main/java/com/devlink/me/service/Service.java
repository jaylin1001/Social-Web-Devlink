package com.devlink.me.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.devlink.dao.Certification;
import com.devlink.dao.Education;
import com.devlink.dao.Exp;
import com.devlink.dao.Honor;
import com.devlink.dao.Img;
import com.devlink.dao.Language;
import com.devlink.dao.Member;
import com.devlink.dao.Patent;
import com.devlink.dao.Search;
import com.devlink.dao.Skill;
import com.devlink.dao.TestScore;

public interface Service {
	String getNo(String id);
	Member getIntro(String id);
	ArrayList<Education> getEdu(String id);
	ArrayList<Certification> getCerti(String id);
	ArrayList<Exp> getExp(String id);
	ArrayList<Honor> getHonor(String id);
	ArrayList<Language> getLang(String id);
	ArrayList<Patent> getPatent(String id);
	ArrayList<Skill> getSkill(String id);
	ArrayList<TestScore> getTestScore(String id);
	void editIntro(Member m);
	Exp addExp(Exp e);
	Education addEdu(Education e);
	Skill addSkill(Skill s);
	Language addLang(Language l);
	Honor addHonor(Honor h);
	Certification addCerti(Certification c);
	Patent addPatent(Patent p);
	TestScore addTs(TestScore t);
	void delPro(String no);
	void addPath(Img img);
	HashMap<String, String> getPath(String id);
	Member login(String id, String pwd);
	ArrayList<Search> srResult(String name,String myno);
	int howSt(ArrayList<Certification> certi, ArrayList<Education> edu, ArrayList<Exp> exp, ArrayList<Honor> honor,
			ArrayList<Language> lang, ArrayList<Skill> skill, ArrayList<Patent> patent, ArrayList<TestScore> ts);
	String howColor(int st);
}
