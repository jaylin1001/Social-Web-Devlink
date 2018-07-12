package com.devlink.msg;

import java.util.List;

public interface MsgService {
	List<Message> setMsg(String to_id, String from_id);
	void addMsg(String from_id, String to_id, String msg);
	List<Friend> setFrd(String my_id);
}
