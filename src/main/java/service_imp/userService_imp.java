package service_imp;

import bean.User;
import dao.userDao;
import dao_imp.userDao_imp;
import service.userService;

public class userService_imp implements userService {

	public boolean isexist(String phoneNumber) {
		// TODO Auto-generated method stub
		userDao ud = new userDao_imp();
		return ud.isexist(phoneNumber);
	}

	public boolean addUser(String phoneNumber, String pwd) {
		// TODO Auto-generated method stub
		userDao ud = new userDao_imp();
		return ud.addUser(phoneNumber, pwd);
	}

	public boolean isexist(String phoneNumber, String pwd) {
		// TODO Auto-generated method stub
		userDao ud = new userDao_imp();
		return ud.isexist(phoneNumber, pwd);
	}

	public boolean updateUser(User us) {
		// TODO Auto-generated method stub
		userDao ud = new userDao_imp();
		return ud.updateUser(us);
	}

	public User queryone(String phoneNumber) {
		// TODO Auto-generated method stub
		userDao ud = new userDao_imp();
		return ud.queryone(phoneNumber);
	}

}
