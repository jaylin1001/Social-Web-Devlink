package com.devlink.member;

import com.devlink.dao.Member;

public interface Service {
	void addMember(Member m);
	
	Member getMember(String id);
	
	Member getMemberPwd(String pwd);
	
	void editEmail(Member m);
	
	void editPhone(Member m);
	
	void editAddress(Member m);
	
	void editPwd(Member m);
	
	void editMember(Member m);
	
	void delMember(String id);

}
