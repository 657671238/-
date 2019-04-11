package dao;

import java.util.List;

import bean.User;
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
	
	//查询全部已请求的任务
	public List<task> queryallselectedtask(String id);
	
	//查询全部发布的任务
	public List<task> queryallmytask(String id);
	
	//查询单个任务的全部信息
	public task queryone(int id);
	
	//更改状态,在增加请求人员时，state++
	public boolean changeState(int id);
	
	//更改状态,在委派任务时，state=-1
	public boolean changeState(int id,int newstate);
	
	public int queryState(int id);

	public List<User> queryallrequestPerson(int taskid);
}
