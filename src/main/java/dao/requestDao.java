package dao;

import bean.request;

public interface requestDao {
	public boolean addRequest(request r);//添加请求
	public boolean isAdd(request r);//查询该请求是否存在
}
