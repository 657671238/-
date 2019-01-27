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
			String sql = "update users set name=? ,school=? ,birth=? where phoneNumber=?";
			boolean updateSuccess = MyDb.getMyDb().cud(sql, us.getName(),us.getSchool(),us.getBirth(),us.getPhoneNumber());
			return updateSuccess;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

}
