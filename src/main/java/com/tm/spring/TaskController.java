package com.tm.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tm.spring.model.*;
import com.tm.spring.service.TaskService;

@Controller
public class TaskController {

	private TaskService taskService;

	@Autowired(required = true)
	@Qualifier(value = "taskService")
	public void setTaskService(TaskService ps) {
		this.taskService = ps;
	}

	@RequestMapping(value = "/tasks", method = RequestMethod.GET)
	public String listTasks(Model model) {
		model.addAttribute("task", new Task());
		model.addAttribute("listTasks", this.taskService.listTasks());
		return "task";
	}

	@RequestMapping(value = "/taskadd", method = RequestMethod.GET)
	public String addTasks(Model model) {
		model.addAttribute("task", new Task());
		model.addAttribute("addTasks", this.taskService.listTasks());
		return "taskadd";
	}
	@RequestMapping("/login")
	public ModelAndView showform() {
		// command is a reserved request attribute name, now use <form> tag to
		// show object data
		return new ModelAndView("login", "command", new Login());
	}

	@RequestMapping(value = "/login/add", method = RequestMethod.POST)
	public String auth(@ModelAttribute("login") Login p, Model m) {
		if (p.getUsername().equals("prabu") && p.getPassword().equals("prabu")) {
			m.addAttribute("message", p.getUsername());
			return "redirect:/tasks";
		}else
		m.addAttribute("alert","Username/Password is invalid");
		return "redirect:/login";

	}
	
	@RequestMapping(value = "/taskadd/new", method = RequestMethod.POST)
	public String addnewTask(@ModelAttribute("taskadd") Task p) {

		if (p.getId() == 0) {
			// new Task, add it
			this.taskService.addTask(p);
			return "redirect:/tasks";
		} else {
			// existing Task, call update
			this.taskService.updateTask(p);
			
		}

		return "redirect:/tasks";

	}
	// For add and update Task both
	/*@RequestMapping(value = "/task/add", method = RequestMethod.POST)
	public String addTask(@ModelAttribute("task") Task p) {

		if (p.getId() == 0) {
			// new Task, add it
			this.taskService.addTask(p);
		} else {
			// existing Task, call update
			this.taskService.updateTask(p);
		}

		return "redirect:/tasks";

	}*/

	@RequestMapping("/remove/{id}")
	public String removeTask(@PathVariable("id") int id) {

		this.taskService.removeTask(id);
		return "redirect:/tasks";
	}

	@RequestMapping("/edit/{id}")
	public String editTask(@PathVariable("id") int id, Model model) {
		model.addAttribute("task", this.taskService.getTaskById(id));
		model.addAttribute("listTasks", this.taskService.listTasks());
		return "taskadd";
	}

}
