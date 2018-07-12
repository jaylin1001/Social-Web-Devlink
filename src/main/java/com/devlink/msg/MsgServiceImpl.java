package com.devlink.msg;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;


@Component("msgService")
public class MsgServiceImpl implements MsgService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private MsgMapper msgMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Message> setMsg(String from_id, String to_id) {
		msgMapper = sqlSession.getMapper(MsgMapper.class);
		return msgMapper.selectMsg(from_id, to_id); 
	}

	@Override
	public void addMsg(String from_id, String to_id, String msg) {
		msgMapper = sqlSession.getMapper(MsgMapper.class);
		msgMapper.insertMsg(from_id, to_id, msg);
	}

	@Override
	public List<Friend> setFrd(String my_id) {
		msgMapper = sqlSession.getMapper(MsgMapper.class);
		return msgMapper.selectFrd(my_id);
	}
}
