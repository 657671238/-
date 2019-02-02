package dao;

import java.util.List;

import bean.task;

public interface taskDao {
	//添加任务
	public boolean addtask(task t);
	
	//更新任务
	public boolean updatetask(task t);
	
	//删除任务
	public boolean deletetask(int id);
	
	//查询任务发布人
	public String getPushPerson(int taskId);
	
	//查询全部任务
	public List<task> queryall();
	
	//查询单个任务的全部信息
	public task queryone(int id);
}
