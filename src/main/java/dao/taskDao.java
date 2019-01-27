package dao;

import bean.task;

public interface taskDao {
	//添加任务
	public boolean addtask(task t);
	
	//更新任务
	public boolean updatetask(task t);
	
	//删除任务
	public boolean deletetask(int id);
}
