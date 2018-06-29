package com.devlink.me.service;

import java.util.ArrayList;

import com.devlink.dao.Certification;
import com.devlink.dao.Education;
import com.devlink.dao.Exp;
import com.devlink.dao.Honor;
import com.devlink.dao.Language;
import com.devlink.dao.Member;
import com.devlink.dao.Skill;
import com.devlink.dao.TestScore;

public interface Service {
	Member getIntro(String id);
	ArrayList<Education> getEdu(String id);
	ArrayList<Certification> getCerti(String id);
	ArrayList<Exp> getExp(String id);
	ArrayList<Honor> getHonor(String id);
	ArrayList<Language> getLang(String id);
	ArrayList<Language> getPatent(String id);
	ArrayList<Skill> getSkill(String id);
	ArrayList<TestScore> getTestScore(String id);	
}
