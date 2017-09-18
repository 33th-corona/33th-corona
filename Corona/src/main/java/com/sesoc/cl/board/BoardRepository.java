
package com.sesoc.cl.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardRepository {

	@Autowired
	SqlSession sqlSession;
	
	public String login(String id, String pw){
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_id", id); map.put("password", pw);
		return dao.login(map);
	}
	
	public List<Board> findAll (String searchtype,String searchword) {
		List<Board> boardList = new ArrayList<Board>();
		//RowBounds rb = new RowBounds(startRecord, countPerPage);
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		Map<String,String> search = new HashMap<String, String>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);
		
		boardList = dao.select(search);
		return boardList;
	}
	
	public Board findOne(int boardnum){
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.selectOne(boardnum);
	}
	

	public int insertBoard(Board board) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.insert(board);
	}

	public int updateBoard(Board board) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		System.out.println(board);
		return dao.update(board);
	}

	public int updateHits(int boardnum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.updateHits(boardnum);
	}
	
	public int deleteForm(int boardnum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.delete(boardnum);
	}
	
	public int replyUpdate(int num, int amount){
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", num); map.put("amount", amount);
		System.out.println("레파 : num: "+num+"amount:"+amount);
		return dao.replyUpdate(map);
	}
	
	//전체 글 개수
	public int getBoardCount(String searchtype,String searchword) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String,String> search = new HashMap<String,String>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);
		//select count(*) from board where title='%' ||''||'%'
		return dao.getBoardCount(search);
	}
	
}
