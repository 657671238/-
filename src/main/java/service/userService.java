package service;

import java.util.List;

import bean.User;
import bean.task;

public interface userService {
	public boolean isexist(String phoneNumber) ;
	public boolean isexist(String phoneNumber, String pwd);
	public boolean addUser(String phoneNumber,String pwd); 	
	public boolean updateUser(User us);
	public User queryone(String phoneNumber);		
	
	public List<task> querytaskbody(List<task> ts);//查询task的发布人信息填充到list中
}
