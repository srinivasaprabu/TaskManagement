package com.tm.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.spring.dao.TaskDAO;
import com.tm.spring.model.Task;
import com.tm.spring.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {
	
	private TaskDAO taskDAO;

	public void setTaskDAO(TaskDAO taskDAO) {
		this.taskDAO = taskDAO;
	}

	@Transactional
	public void addTask(Task p) {
		this.taskDAO.addTask(p);
	}

	@Transactional
	public void updateTask(Task p) {
		this.taskDAO.updateTask(p);
	}

	@Transactional
	public List<Task> listTasks() {
		return this.taskDAO.listTasks();
	}

	@Transactional
	public Task getTaskById(int id) {
		return this.taskDAO.getTaskById(id);
	}

	@Transactional
	public void removeTask(int id) {
		this.taskDAO.removeTask(id);
	}

}
