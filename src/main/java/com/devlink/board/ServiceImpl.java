package com.devlink.board;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.devlink.dao.Board;
import com.devlink.dao.Member;
import com.devlink.me.model.BoardMapper;
import com.devlink.me.model.MemberMapper;

// 빈등록
@Component("boardService")
public class ServiceImpl implements Service {
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private BoardMapper boardMapper;
	private MemberMapper memberMapper;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addBoard(Board b) {
		// TODO Auto-generated method stub
		boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.insertBoard(b);
		
	}

	@Override
	public ArrayList<Board> getBoard(String id) {
		// TODO Auto-generated method stub
		boardMapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Board> b = boardMapper.selectBoard(id);
		System.out.println(b);
		return b;
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
	public Board getContents(String bno) {
		// TODO Auto-generated method stub
		System.out.println("serviceImpl");
		boardMapper = sqlSession.getMapper(BoardMapper.class);
		Board b= boardMapper.selectContents(bno);
		System.out.println(b);
		return b;
	}
	
	

}
