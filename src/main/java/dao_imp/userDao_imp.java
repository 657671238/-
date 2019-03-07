package dao_imp;

import java.sql.ResultSet;

import bean.User;
import dao.userDao;
import util.MyDb;

public class userDao_imp implements userDao{

	public boolean isexist(String phoneNumber) {
		// TODO Auto-generated method stub
		try {
			ResultSet rs = MyDb.getMyDb().query("select * from users where phoneNumber= ? ", phoneNumber);
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	public boolean isexist(String phoneNumber ,String password) {
		try {
			ResultSet rs = MyDb.getMyDb().query("select * from users where phoneNumber=? and pwd=?", phoneNumber,password);
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	public boolean addUser(String phoneNumber, String pwd) {
		// TODO Auto-generated method stub
		try {
			String sql = "insert into users(phoneNumber,pwd) value(? ,?)";
			boolean addSuccess = MyDb.getMyDb().cud(sql, phoneNumber,pwd);
			return addSuccess;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateUser(User us) {
		// TODO Auto-generated method stub
		try {
			String sql = "update users set name=? ,school=? ,birth=?,image=? where phoneNumber=?";
			boolean updateSuccess = MyDb.getMyDb().cud(sql, us.getName(),us.getSchool(),us.getBirth(),us.getImage(),us.getPhoneNumber());
			return updateSuccess;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	public User queryone(String phoneNumber) {
		// TODO Auto-generated method stub
		User us = new User();
		try {
			String sql = "select * from users where phoneNumber = ?";
			ResultSet rs = MyDb.getMyDb().query(sql, phoneNumber);
			if(rs.next()) {
				us.setPhoneNumber(phoneNumber);
				us.setName(rs.getString("name"));
				us.setSchool(rs.getString("school"));
				us.setBirth(rs.getDate("birth"));
				us.setImage(rs.getString("image"));
			}
			return us;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return us;
	}

}
