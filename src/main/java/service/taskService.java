package service;

import java.util.List;

import bean.task;

public interface taskService {
	public List<task> queryall();
	
	public boolean addtask(task t); 
	
	public boolean isMytask(int taskId,String phoneNumber);
	
	public task queryone(int id);

}
