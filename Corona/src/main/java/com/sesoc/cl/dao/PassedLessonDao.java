package com.sesoc.cl.dao;

import java.util.List;

import com.sesoc.cl.vo.SavedLessonInfo;

public interface PassedLessonDao {

	public int saveLesson(SavedLessonInfo savedLessonInfo);

	public List<SavedLessonInfo> loadSavedLesson(int classNum);
	
}