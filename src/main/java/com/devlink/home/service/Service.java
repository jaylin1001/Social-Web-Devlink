package com.devlink.home.service;
 
import java.util.ArrayList;

import com.devlink.dao.Coment;
import com.devlink.dao.HomeContents;

public interface Service {
	void writeinsert(HomeContents homecontents);
	void cmtinsert(Coment coment);
	void docnumdelete(String doc_num);
	ArrayList<HomeContents> docselect(String m_no);
	ArrayList<HomeContents> doccmtselect(String doc_num);
}
