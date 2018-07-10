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
import com.devlink.dao.Search;
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
		System.out.println("getNo()");
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
	public Member login(String id, String pwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		mapper = sqlSession.getMapper(MemberMapper.class);
		map.put("id", id);
		map.put("pwd", pwd);
		Member m=mapper.selectForLogin(map);
		return m;
	}

	@Override
	public ArrayList<Search> srResult(String name) {
		mapper = sqlSession.getMapper(MemberMapper.class);
		HashMap<String,String> hmap  = mapper.function(name);
		name=hmap.get("path");
		name=replace(name);
		System.out.println("변환 : " +name);
		return mapper.selectSRResult(name);
	}
	

	private String replace(String nmdiv) {
		String result="";
		for(int i=0;i<nmdiv.length();i++) {
			if(nmdiv.charAt(i)=='ᄀ') {
				result+="ㄱ";
			}else if(nmdiv.charAt(i)=='ᆨ') {
				result+="ㄱ";
			}else if(nmdiv.charAt(i)=='ᄂ') {
				result+="ㄴ";
			}else if(nmdiv.charAt(i)=='ᆫ') {
				result+="ㄴ";
			}else if(nmdiv.charAt(i)=='ᄃ') {
				result+="ㄷ";
			}else if(nmdiv.charAt(i)=='ᆮ') {
				result+="ㄷ";
			}else if(nmdiv.charAt(i)=='ᄅ') {
				result+="ㄹ";
			}else if(nmdiv.charAt(i)=='ᆯ') {
				result+="ㄹ";
			}else if(nmdiv.charAt(i)=='ᄆ') {
				result+="ㅁ";
			}else if(nmdiv.charAt(i)=='ᆷ') {
				result+="ㅁ";
			}else if(nmdiv.charAt(i)=='ᄇ') {
				result+="ㅂ";
			}else if(nmdiv.charAt(i)=='ᆸ') {
				result+="ㅂ";
			}else if(nmdiv.charAt(i)=='ᄉ') {
				result+="ㅅ";
			}else if(nmdiv.charAt(i)=='ᆺ') {
				result+="ㅅ";
			}else if(nmdiv.charAt(i)=='ᄋ') {
				result+="ㅇ";
			}else if(nmdiv.charAt(i)=='ᆼ') {
				result+="ㅇ";
			}else if(nmdiv.charAt(i)=='ᄌ') {
				result+="ㅈ";
			}else if(nmdiv.charAt(i)=='ᆽ') {
				result+="ㅈ";
			}else if(nmdiv.charAt(i)=='ᄎ') {
				result+="ㅊ";
			}else if(nmdiv.charAt(i)=='ᆾ') {
				result+="ㅊ";
			}else if(nmdiv.charAt(i)=='ᄏ') {
				result+="ㅋ";
			}else if(nmdiv.charAt(i)=='ᆿ') {
				result+="ㅋ";
			}else if(nmdiv.charAt(i)=='ᄐ') {
				result+="ㅌ";
			}else if(nmdiv.charAt(i)=='ᇀ') {
				result+="ㅌ";
			}else if(nmdiv.charAt(i)=='ᄑ') {
				result+="ㅍ";
			}else if(nmdiv.charAt(i)=='ᇁ') {
				result+="ㅍ";
			}else if(nmdiv.charAt(i)=='ᄒ') {
				result+="ㅎ";
			}else if(nmdiv.charAt(i)=='ᇂ') {
				result+="ㅎ";
			}else if(nmdiv.charAt(i)=='ᅡ') {
				result+="ㅏ";
			}else if(nmdiv.charAt(i)=='ᅣ') {
				result+="ㅑ";
			}else if(nmdiv.charAt(i)=='ᅥ') {
				result+="ㅓ";
			}else if(nmdiv.charAt(i)=='ᅧ') {
				result+="ㅕ";
			}else if(nmdiv.charAt(i)=='ᅩ') {
				result+="ㅗ";
			}else if(nmdiv.charAt(i)=='ᅭ') {
				result+="ㅛ";
			}else if(nmdiv.charAt(i)=='ᅮ') {
				result+="ㅜ";
			}else if(nmdiv.charAt(i)=='ᅲ') {
				result+="ㅠ";
			}else if(nmdiv.charAt(i)=='ᅳ') {
				result+="ㅡ";
			}else if(nmdiv.charAt(i)=='ᅵ') {
				result+="ㅣ";
			}else if(nmdiv.charAt(i)=='ᅢ') {
				result+="ㅐ";
			}else if(nmdiv.charAt(i)=='ᅤ') {
				result+="ㅒ";
			}else if(nmdiv.charAt(i)=='ᅦ') {
				result+="ㅔ";
			}else if(nmdiv.charAt(i)=='ᅨ') {
				result+="ㅖ";
			}else if(nmdiv.charAt(i)=='ᅬ') {
				result+="ㅚ";
			}else if(nmdiv.charAt(i)=='ᅫ') {
				result+="ㅙ";
			}else if(nmdiv.charAt(i)=='ᅱ') {
				result+="ㅟ";
			}else if(nmdiv.charAt(i)=='ᅴ') {
				result+="ㅢ";
			}else if(nmdiv.charAt(i)=='ᄁ') {
				result+="ㄲ";
			}else if(nmdiv.charAt(i)=='ᆩ') {
				result+="ㄲ";
			}else if(nmdiv.charAt(i)=='ᄄ') {
				result+="ㄸ";
			}else if(nmdiv.charAt(i)=='ᄈ') {
				result+="ㅃ";
			}else if(nmdiv.charAt(i)=='ᄊ') {
				result+="ㅆ";
			}else if(nmdiv.charAt(i)=='ᆻ') {
				result+="ㅆ";
			}else if(nmdiv.charAt(i)=='ᄍ') {
				result+="ㅉ";
			}else if(nmdiv.charAt(i)=='ᆪ') {
				result+="ㄳ";
			}else if(nmdiv.charAt(i)=='ᆬ') {
				result+="ㄵ";
			}else if(nmdiv.charAt(i)=='ᆭ') {
				result+="ㄶ";
			}else if(nmdiv.charAt(i)=='ᆰ') {
				result+="ㄺ";
			}else if(nmdiv.charAt(i)=='ᆱ') {
				result+="ㄻ";
			}else if(nmdiv.charAt(i)=='ᆲ') {
				result+="ㄼ";
			}else if(nmdiv.charAt(i)=='ᆳ') {
				result+="ㄽ";
			}else if(nmdiv.charAt(i)=='ᆴ') {
				result+="ㄾ";
			}else if(nmdiv.charAt(i)=='ᆶ') {
				result+="ㅀ";
			}else if(nmdiv.charAt(i)=='ᆹ') {
				result+="ㅄ";
			}else if(nmdiv.charAt(i)=='＃') {
				result+="";
			}else if(nmdiv.charAt(i)==' ') {
				result+=" ";
			}
		}
		return result;
	}
}
