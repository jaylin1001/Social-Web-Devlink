package com.devlink.member;

import javax.annotation.Resource;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.devlink.dao.Member;
import com.devlink.me.model.MemberMapper;

//빈등록
@Component("memService")	//객체이름
public class ServiceImpl implements Service{
	
	@Resource(name="sqlSession")	//의존성주입
	private SqlSession sqlSession;
	private MemberMapper memberMapper;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addMember(Member m) {
		// TODO Auto-generated method stub
		System.out.println("addMember" + m);
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.insert(m);
	}

	@Override
	public Member getMember(String id) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		Member m =memberMapper.select(id);
		System.out.println(m);
		return m;
	}

	@Override
	public void editMember(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.update(m);
	}

	@Override
	public void delMember(String id) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.delete(id);
	}

	@Override
	public void editEmail(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateemail(m);
		
	}

	@Override
	public void editPhone(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updatephone(m);
		
	}

	@Override
	public void editAddress(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateaddress(m);
		
		
	}

	@Override
	public void editPwd(Member m) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updatepwd(m);
	}

	@Override
	public Member getMemberPwd(String pwd) {
		// TODO Auto-generated method stub
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		Member m = memberMapper.selectpwd(pwd);
		return m;
	}



}
