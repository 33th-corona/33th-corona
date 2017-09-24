package com.sesoc.cl.drive;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DriveRepository {
	@Autowired
	SqlSession sqlSession;
	
	public List<Drive> selectDriveAll(String searchtype,String searchword,int startRecord,int countPerPage){
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Map<String,String> search = new HashMap<String, String>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);
		return dao.selectDriveAll(search,rb);
	}
	
	public Drive selectOne(int num) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.selectOne(num);
	}
	
	public List<Drive> selectDrive_fileAll(int drive_num){
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.selectDrive_fileAll(drive_num);
	}
	
	public Drive selectFileOne(int num) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.selectFileOne(num);
	}
	
	public int deleteFile(int fileNum) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.deleteFile(fileNum);
	}
	
	public int delete_drive(int num) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.delete_drive(num);
	}
	
	public int updateOne(Drive drive) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.updateOne(drive);
	}
	
	public int updateFile(int num) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.updateFile(num);
	}
	
	public int updateHit(int num) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.updateHit(num);
	}
	
	public int seq() {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.seq();
	}
	
	public int insert(Drive drive) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		System.out.println("dao : "+drive);
		return dao.insert(drive);
	}
	public int insert_file(Drive drive) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.insert_file(drive);
	}
	
	public int getDriveCount(String searchtype, String searchword) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		Map<String,String> search = new HashMap<String,String>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);
		return dao.getDriveCount(search);
	}

	public int updateDownCount(int num) {
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.updateDownCount(num);
	}

}
