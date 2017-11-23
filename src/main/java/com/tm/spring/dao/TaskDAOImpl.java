package com.tm.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.tm.spring.model.Task;

@Repository
public class TaskDAOImpl implements TaskDAO {
	private static final Logger logger = LoggerFactory.getLogger(TaskDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	public void addTask(Task p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Task saved successfully, Task Details="+p);
		
	}

	public void updateTask(Task p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Task updated successfully, Task Details="+p);
		
	}

	public List<Task> listTasks() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Task> tasksList = session.createQuery("from Task").list();
		for(Task p : tasksList){
			logger.info("Task List::"+p);
		}
		return tasksList;	}

	public Task getTaskById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Task p = (Task) session.load(Task.class, new Integer(id));
		logger.info("Task loaded successfully, Task details="+p);
		return p;
	}

	public void removeTask(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Task p = (Task) session.load(Task.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Task deleted successfully, task details="+p);
		
	}
	
	
}
