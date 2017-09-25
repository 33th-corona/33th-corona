package com.sesoc.cl.dao;

import java.util.List;

import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Answer;
import com.sesoc.cl.vo.Task_Submit;

public interface TaskDAO {
	
	public int insertTask(Task task);
	public List<Task> selectAll(int class_num);
	public Task selectOne(Task task);
	public int closed_work();
	public Task recent_task();
	public int insertAnswer(Task_Answer task_answer);
	public List<Task_Answer> io_receive(int task_num);
	public List<Task> submittedTask(Task_Submit task_Submit);
}
