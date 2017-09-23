package com.sesoc.cl.dao;

import java.util.List;

import com.sesoc.cl.vo.TaskAnswer;
import com.sesoc.cl.vo.TaskInfo;

public interface TaskDAO {
	
	public int insertTask(TaskInfo task);
	public List<TaskInfo> selectAll(int class_num);
	public TaskInfo selectOne(TaskInfo task);
	public int closed_work();
	public TaskInfo recent_task();
	public int insertAnswer(TaskAnswer task_answer);
	public List<TaskAnswer> io_receive(int task_num);
	
}
