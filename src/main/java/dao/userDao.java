package dao;

import bean.User;

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
}
