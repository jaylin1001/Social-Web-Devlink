package com.devlink.network.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.devlink.dao.Frd;
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
		HashMap<String, String> temp=mapper.selectIngFrdNo(map);
		if(temp==null)
			return null;
		return temp.get("frd_no");
	}
	@Override
	public String getIngFrdToMeNo(String myno, String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("no", no);
		HashMap<String, String> temp=mapper.getIngFrdToMeNo(map);
		if(temp==null)
			return null;
		return temp.get("frd_no");
	}

	@Override
	public String getFrdFromMeNo(String myno, String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("no", no);
		HashMap<String, String> temp=mapper.getFrdFromMeNo(map);
		if(temp==null)
			return null;
		return temp.get("frd_no");
	}
	
	@Override
	public void delFrdFrom(String frdNo) {
		mapper = sqlSession.getMapper(NetMapper.class);
		mapper.deleteFrdFrom(frdNo);
	}

	@Override
	public String isFrd(String myno, String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("no", no);
		HashMap<String, String> temp=mapper.isFrd(map);
		if(temp==null)
			return null;
		return temp.get("frd_no");		
	}

	@Override
	public void frdtoOk(String frdNo) {
		mapper = sqlSession.getMapper(NetMapper.class);
		mapper.updateFrdtoOk(frdNo);		
	}

	@Override
	public void addFrdReq(String myno, String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("no", no);
		mapper.insertFrdReq(map);		
	}

	@Override
	public void delFrdReq(String myno, String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("no", no);
		mapper.deleteFrdReq(map);
	}

	@Override
	public void delFrd(String myno, String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("no", no);
		mapper.deleteFrd(map);
	}

	@Override
	public String getIdByNo(String no) {
		mapper = sqlSession.getMapper(NetMapper.class);
		return mapper.selectIdByNo(no);
	}

	@Override
	public ArrayList<Member> getFrdlike(String str,String myno) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("str", str);
		return mapper.selFrdlike(map);
	}

	@Override
	public ArrayList<Member> getFrdinglike(String str,String myno) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("str", str);
		return mapper.selFrdinglike(map);
	}

	@Override
	public ArrayList<Member> getFrdinglike2(String str, String myno) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("str", str);
		return mapper.selFrdinglike2(map);
	}
	
	@Override
	public ArrayList<Member> getFrdPlike(String str,String myno) {
		mapper = sqlSession.getMapper(NetMapper.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myno", myno);
		map.put("str", str);
		return mapper.selFrdPlike(map);
	}

	@Override
	public void delIngFrd(String frdNo) {
		mapper = sqlSession.getMapper(NetMapper.class);
		mapper.delIngFrd(frdNo);
	}
}