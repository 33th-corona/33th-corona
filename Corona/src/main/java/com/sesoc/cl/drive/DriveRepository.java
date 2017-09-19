package com.sesoc.cl.drive;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DriveRepository {
	@Autowired
	SqlSession sqlSession;
	
	public List<Drive> selectDriveAll(){
		DriveDAO dao = sqlSession.getMapper(DriveDAO.class);
		return dao.selectDriveAll();
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

}
