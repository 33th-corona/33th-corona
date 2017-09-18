package com.sesoc.cl.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;


public interface BoardDAO {

	public List<Board> select(Map<String,String> search);
	public int insert(Board board);
	public int delete(int num);
	public int update(Board board);
	public Board selectOne(int boardnum);
	public int getBoardCount(Map<String,String> map);
	public int updateHits(int boardnum);
	public int replyUpdate(Map<String,Integer> map);
	
	//임시 로그인용
	public String login(Map<String,String> map);
	
}
