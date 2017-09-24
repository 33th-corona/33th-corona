package com.sesoc.cl.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.SavedLessonInfo;

@Repository
public class PassedLessonRepository {

	@Autowired
	SqlSession sqlSession;
	
	public int saveLesson(SavedLessonInfo savedLessonInfo) {
		PassedLessonDao dao = sqlSession.getMapper(PassedLessonDao.class);
		return dao.saveLesson(savedLessonInfo);
	}

	public List<SavedLessonInfo> loadSavedLesson(int classNum) {
		PassedLessonDao dao = sqlSession.getMapper(PassedLessonDao.class);
		return dao.loadSavedLesson(classNum);
	}
	
}