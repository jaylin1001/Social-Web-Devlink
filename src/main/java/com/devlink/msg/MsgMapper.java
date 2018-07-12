package com.devlink.msg;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MsgMapper {
	List<Message> selectMsg(@Param("to_id")String to_id,
			@Param("from_id") String from_id);
	void insertMsg(@Param("from_id") String from_id,
			@Param("to_id") String to_id,
			@Param("msg")String msg );
	List<Friend> selectFrd(String my_id);
}
