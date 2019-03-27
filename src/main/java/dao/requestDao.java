package dao;

import java.util.List;

import bean.request;

public interface requestDao {
	public boolean addRequest(request r);//添加请求
	public boolean isAdd(request r);//查询该请求是否存在
	public boolean deleteRequests(int id);//删除某个任务请求
	public List<request> queryAllRequest(int taskId);//查询所有请求信息
	public boolean delchangestate(int newstate,int task_id);//改变请求状态-1为拒绝 1为接受
	public boolean changeusersState(int task_id,String[] users);//更改委派人员请求状态
	public boolean changeotherState(int task_id);
}
