package com.sesoc.cl.drive;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;


public interface DriveDAO {
	public List<Drive> selectDriveAll(Map<String,String> search, RowBounds rb);
	public Drive selectOne(int num);
	public List<Drive> selectDrive_fileAll(int drive_num);
	public Drive selectFileOne(int num);
	public int deleteFile(int fileNum);
	public int updateOne(Drive drive);
	public int updateFile(int num);
	public int updateHit(int num);
	public int seq();
	public int insert(Drive drive);
	public int insert_file(Drive drive);
	public int delete_drive(int num);
	public int getDriveCount(Map<String, String> map);
}
