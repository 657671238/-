package service_imp;

import dao_imp.userDao_imp;
import service.userService;

public class userService_imp implements userService {

	public boolean isexist(String phoneNumber) {
		// TODO Auto-generated method stub
		userDao_imp ud = new userDao_imp();
		return ud.isexist(phoneNumber);
	}

	public boolean addUser(String phoneNumber, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

}
