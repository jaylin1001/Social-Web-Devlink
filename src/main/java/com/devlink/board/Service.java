package com.devlink.board;

import java.util.ArrayList;

import com.devlink.dao.Board;
import com.devlink.dao.Member;

public interface Service {
	void addBoard(Board b);
	ArrayList<Board> getBoard(String id);
	Member getMember(String id);
	Board getContents(String bno);

}
