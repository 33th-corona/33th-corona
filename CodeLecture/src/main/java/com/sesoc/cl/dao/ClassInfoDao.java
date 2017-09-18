package com.sesoc.cl.dao;

import java.util.List;
import java.util.Map;

import com.sesoc.cl.vo.ClassCount;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.ClassUser;


public interface ClassInfoDao {
	int createClass(ClassInfo createClass);
	ClassInfo checkClassName(String name);
	List<ClassInfo> selectMyAll(String teacher_id);
	List<ClassCount> selectCount(String teacher_id);
	List<ClassCount> selectSearchCount(Map<String, Object> map);
	List<ClassUser> selectUserAll(int class_num);
	ClassInfo selectClassOne(int num);
	int updateStatus(Map<String, Object> map);
	int deleteRetired(int num);
	List<ClassInfo> selectSearch(Map<String, Object> map);
	List<ClassUser> selectMyRequestAll(String user_id);
	ClassUser selectDuplicateCheckOne(ClassUser user);
	int insertClassUser(ClassUser user);
}
