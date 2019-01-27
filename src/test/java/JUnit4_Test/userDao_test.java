package JUnit4_Test;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;

import bean.User;
import dao_imp.userDao_imp;

public class userDao_test {

	@Test
	public void testIsexistString() {
		System.out.println(new userDao_imp().isexist("15871871061"));
	}

	@Test
	public void testIsexistStringString() {
		System.out.println(new userDao_imp().isexist("15871871061","xk19981111"));
	}

	@Test
	public void testAddUser() {
		boolean addSuccess = new userDao_imp().addUser("15871871061", "xk19981111");
		if(addSuccess) {
			System.out.println("添加数据成功");
		}
		
	}

	@Test
	public void testUpdateUser() {
		User us = new User();
		us.setPhoneNumber("15871871061");
		us.setName("xukang123");
		us.setBirth(new java.sql.Date(new Date().getTime()));
		boolean updateSuccess = new userDao_imp().updateUser(us);
		
		if(updateSuccess) {
			System.out.println("数据添加成功");
		}
	}

}
