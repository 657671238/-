package service;

import bean.User;

public interface userService {
	public boolean isexist(String phoneNumber) ;
	public boolean isexist(String phoneNumber, String pwd);
	public boolean addUser(String phoneNumber,String pwd); 	
	public boolean updateUser(User us);
}
