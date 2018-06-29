package com.devlink.me.model;

import java.util.ArrayList;

import com.devlink.dao.Certification;
import com.devlink.dao.Education;
import com.devlink.dao.Exp;
import com.devlink.dao.Honor;
import com.devlink.dao.Language;
import com.devlink.dao.Member;
import com.devlink.dao.Skill;
import com.devlink.dao.TestScore;

public interface MemberMapper {
	Member selectIntroById(String id);
	ArrayList<Education> selectEduById(String id);
	ArrayList<Certification> selectCertiById(String id);
	ArrayList<Exp> selectExpById(String id);
	ArrayList<Honor> selectHonorById(String id);
	ArrayList<Language> selectLangById(String id);
	ArrayList<Language> selectPatentById(String id);
	ArrayList<Skill> selectSkillById(String id);
	ArrayList<TestScore> selectTSById(String id);	
}
