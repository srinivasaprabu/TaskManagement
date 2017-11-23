package com.tm.spring.dao;

import java.util.List;

import com.tm.spring.model.Task;

public interface TaskDAO {

	public void addTask(Task p);
	public void updateTask(Task p);
	public List<Task> listTasks();
	public Task getTaskById(int id);
	public void removeTask(int id);
}
