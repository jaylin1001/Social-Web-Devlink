package com.devlink.network.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.devlink.dao.Frd;
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
	public ArrayList<Frd> getFrdTo(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrdTo(no);
	}

	@Override
	public ArrayList<Frd> getFrdFrom(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrdFrom(no);
	}

	@Override
	public ArrayList<Frd> getFrdP(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrdP(no);
	}

	@Override
	public ArrayList<Frd> getFrd(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrd(no);
	}

	@Override
	public ArrayList<Frd> getFrdAll(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectFrdAll(no);
	}
}