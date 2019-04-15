package service;

import java.util.List;

import org.junit.validator.PublicClassValidator;

import bean.request;

public interface requestService {
	public boolean requestTask(request r);//用户请求任务
	public List<request> queryAllRequest(int taskId);//查询数据
	public boolean isRequest(request r);//查询用户是否已请求该任务 
}
