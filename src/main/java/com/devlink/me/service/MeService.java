package com.devlink.me.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;

import com.devlink.dao.Certification;
import com.devlink.dao.Education;
import com.devlink.dao.Exp;
import com.devlink.dao.Honor;
import com.devlink.dao.Language;
import com.devlink.dao.Member;
import com.devlink.dao.Skill;
import com.devlink.dao.TestScore;
import com.devlink.me.model.MemberMapper;

public class MeService implements Service {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private MemberMapper mapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public Member getIntro(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectIntroById(id); 
	}

	@Override
	public ArrayList<Education> getEdu(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectEduById(id);
	}

	@Override
	public ArrayList<Certification> getCerti(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectCertiById(id);
	}

	@Override
	public ArrayList<Exp> getExp(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectExpById(id);
	}

	@Override
	public ArrayList<Honor> getHonor(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectHonorById(id);
	}

	@Override
	public ArrayList<Language> getLang(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectLangById(id);
	}

	@Override
	public ArrayList<Language> getPatent(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectPatentById(id);
	}
	
	@Override
	public ArrayList<Skill> getSkill(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectSkillById(id);
	}

	@Override
	public ArrayList<TestScore> getTestScore(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectTSById(id);
	}
}
