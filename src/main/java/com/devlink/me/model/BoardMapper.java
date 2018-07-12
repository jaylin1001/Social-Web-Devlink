package com.devlink.me.model;

import java.util.ArrayList;

import com.devlink.dao.Board;

public interface BoardMapper {
	void insertBoard(Board b);
	ArrayList<Board> selectBoard(String id);
	Board selectContents(String bno);
}
