package com.devlink.home.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.devlink.dao.Coment;
import com.devlink.dao.HomeContents;
import com.devlink.home.model.HomeMapper;

@Component("mainService")
public class HomeService implements Service {
@Resource(name="sqlSession")
private SqlSession sqlSession;
private HomeMapper mapper;

	@Override
	public void writeinsert(HomeContents homecontents) {
		mapper = sqlSession.getMapper(HomeMapper.class);
		mapper.writeinsert(homecontents);
	}

	@Override
	public void cmtinsert(Coment coment) {
		mapper = sqlSession.getMapper(HomeMapper.class);
		mapper.cmtinsert(coment);		
	}
	@Override
	public void docnumdelete(String doc_num) {
		mapper = sqlSession.getMapper(HomeMapper.class);
		mapper.docnumdelete(doc_num);
		
	}
	
	@Override
	public ArrayList<HomeContents> docselect(String m_no) {
			mapper = sqlSession.getMapper(HomeMapper.class);
			return mapper.docselect(m_no);
		
	}

	@Override
	public ArrayList<HomeContents> doccmtselect(String doc_num) {
		mapper = sqlSession.getMapper(HomeMapper.class);
		return mapper.doccmtselect(doc_num);
	
	}

	




}
