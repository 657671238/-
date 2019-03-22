package dao;

import java.util.List;

import bean.User;
import bean.request;
import bean.task;

public interface userDao {
	public boolean isexist(String phoneNumber);
	// TODO 查询电话是否被注册过
	
	public boolean isexist(String phoneNumber, String password);
	// TODO 验证登陆密码是否正确
	
	public boolean addUser(String phoneNumber,String pwd);
	// TODO 添加用户 
	
	public boolean updateUser(User us);
	// TODO 修改用户信息
	
	public User queryone(String phoneNumber);
	// TODO 根据主键查询用户信息
	
	public List<task> querytask(List<task> ts);//查询task的发布人信息填充到list中
	
	
	public List<request> queryusermessage(List<request> rs);//查询请求人的相关基本信息
}
