package com.devlink.network.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	@Override
	public String getIngFrdNo(String myno, String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("no", no);
		return mapper.selectIngFrdNo(map).get("frd_no");
	}
	
	@Override
	public void delFrdFrom(String frdNo) {
		mapper = sqlSession.getMapper(NetMapper.class);
		mapper.deleteFrdFrom(frdNo);
	}
}