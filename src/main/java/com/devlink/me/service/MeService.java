package com.devlink.me.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

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
import com.devlink.me.model.MemberMapper;

@Component("meService")
public class MeService implements Service {
@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private MemberMapper mapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String getNo(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		HashMap<String,String> hmap = mapper.selectNoById(id);
		return hmap.get("no");
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
	public ArrayList<Patent> getPatent(String id) {
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

	@Override
	public void editIntro(Member m) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.updateIntro(m);
	}

	@Override
	public Exp addExp(Exp e) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertExp(e);
		return mapper.selectExp(e.getNo());
	}

	@Override
	public Education addEdu(Education e) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertEdu(e);
		return mapper.selectEdu(e.getNo());
	}

	@Override
	public Skill addSkill(Skill s) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertSkill(s);
		return mapper.selectSkill(s.getNo());
	}

	@Override
	public Language addLang(Language l) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertLang(l);
		return mapper.selectLang(l.getNo());
	}

	@Override
	public Honor addHonor(Honor h) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertHonor(h);
		return mapper.selectHonor(h.getNo());
	}
	@Override
	public Certification addCerti(Certification c) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertCerti(c);
		return mapper.selectCerti(c.getNo());
	}
	@Override
	public Patent addPatent(Patent p) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertPatent(p);
		return mapper.selectPatent(p.getNo());
	}

	@Override
	public TestScore addTs(TestScore t) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertTS(t);
		return mapper.selectTS(t.getNo());
	}

	@Override
	public void delPro(String no) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.deletePro(no);
	}

	@Override
	public void addPath(Img img) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.insertPath(img);
	}

	@Override
	public HashMap<String, String> getPath(String id) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectPath(id);
	}

	@Override
	public boolean login(String id, String pwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		mapper = sqlSession.getMapper(MemberMapper.class);
		map.put("id", id);
		map.put("pwd", pwd);
		Member m=mapper.selectForLogin(map);
		if(m==null) {
			return false;
		}else {
			return true;
		}
	}
}
