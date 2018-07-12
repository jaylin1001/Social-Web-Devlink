package com.devlink.home.model;

import java.util.ArrayList;

import com.devlink.dao.Coment;
import com.devlink.dao.HomeContents;

public interface HomeMapper {
	ArrayList<HomeContents> docselect(String m_no);
	ArrayList<HomeContents> doccmtselect(String doc_num);
	void writeinsert(HomeContents homecontents);
	void cmtinsert(Coment coment);
	void docnumdelete(String doc_num);
	
}
