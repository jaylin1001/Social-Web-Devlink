package com.devlink.me.model;

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
import com.devlink.dao.Skill;
import com.devlink.dao.TestScore;

public interface MemberMapper {
	HashMap<String, String> selectNoById(String id);
	Member selectIntroById(String id);
	ArrayList<Education> selectEduById(String id);
	ArrayList<Certification> selectCertiById(String id);
	ArrayList<Exp> selectExpById(String id);
	ArrayList<Honor> selectHonorById(String id);
	ArrayList<Language> selectLangById(String id);
	ArrayList<Patent> selectPatentById(String id);
	ArrayList<Skill> selectSkillById(String id);
	ArrayList<TestScore> selectTSById(String id);
	void updateIntro(Member m);
	void insertExp(Exp e);
	Exp selectExp(String no);
	void insertEdu(Education e);
	Education selectEdu(String no);
	void insertSkill(Skill s);
	Skill selectSkill(String no);
	void insertLang(Language l);
	Language selectLang(String no);
	void insertHonor(Honor h);
	Honor selectHonor(String no);
	void insertCerti(Certification c);
	Certification selectCerti(String no);
	void insertPatent(Patent p);
	Patent selectPatent(String no);
	void insertTS(TestScore t);
	TestScore selectTS(String no);
	void deletePro(String no);
	void insertPath(Img img);
	HashMap<String, String> selectPath(String id);
	Member selectForLogin(HashMap<String, String> map);
}
