package com.sesoc.cl.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.TaskAnswer;
import com.sesoc.cl.vo.TaskInfo;

@Repository
public class TaskRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertTask(TaskInfo task) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.insertTask(task);
		return result;
	}
	
	
	public List<TaskInfo> selectAll(int class_num) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		List<TaskInfo> taskList = dao.selectAll(class_num);
		return taskList;
	}
	
	public TaskInfo selectOne(TaskInfo task) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		TaskInfo selectedTask = dao.selectOne(task);
		return selectedTask;
	}
	
	public int closed_work() {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.closed_work();
		return result;
	}
	
	public TaskInfo recent_task() {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		TaskInfo selectedTask = dao.recent_task();
		return selectedTask;
	}

	public int insertAnswer(TaskAnswer task_answer) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.insertAnswer(task_answer);
		return result;
	}
	
	public List<TaskAnswer> io_receive(int task_num) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		List<TaskAnswer> selectedAnswer = dao.io_receive(task_num);
		return selectedAnswer;
	}

}
