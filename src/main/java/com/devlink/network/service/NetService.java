package com.devlink.network.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.devlink.dao.Member;
import com.devlink.network.model.NetMapper;

@Component("netService")
public class NetService implements Service {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private NetMapper mapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public ArrayList<Member> getFrdTo(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrdTo(no);
	}

	@Override
	public ArrayList<Member> getFrdFrom(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrdFrom(no);
	}

	@Override
	public ArrayList<Member> getFrdP(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrdP(no);
	}
}