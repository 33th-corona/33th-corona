package com.sesoc.cl.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Answer;

@Repository
public class TaskRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertTask(Task task) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.insertTask(task);
		return result;
	}
	
	
	public List<Task> selectAll(int class_num) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		List<Task> taskList = dao.selectAll(class_num);
		return taskList;
	}
	
	public Task selectOne(Task task) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		Task selectedTask = dao.selectOne(task);
		return selectedTask;
	}
	
	public int closed_work() {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.closed_work();
		return result;
	}
	
	public Task recent_task() {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		Task selectedTask = dao.recent_task();
		return selectedTask;
	}

	public int insertAnswer(Task_Answer task_answer) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.insertAnswer(task_answer);
		return result;
	}
	
	public List<Task_Answer> io_receive(int task_num) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		List<Task_Answer> selectedAnswer = dao.io_receive(task_num);
		return selectedAnswer;
	}

}
