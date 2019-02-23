package dao_imp;

import java.sql.ResultSet;

import bean.request;
import dao.requestDao;
import util.MyDb;

public class requestDao_imp implements requestDao {
	public boolean addRequest(request r){
		try {
			String sql = "insert into requests(task_ID,requestPhone,requestDate) value(?,?,?)";
			boolean successAddRequest = MyDb.getMyDb().cud(sql, r.getTaskId(),r.getMyPhone(),r.getRequestDate());
			return successAddRequest;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}

	public boolean isAdd(request r) {
		// TODO Auto-generated method stub
		try {
			boolean isadd=false;
			String sql = "select * from requests where task_ID = ? and requestPhone = ?";
			ResultSet rs = MyDb.getMyDb().query(sql, r.getTaskId(),r.getMyPhone());
			if(rs.next()) {
				isadd = true;
			}
			return isadd;
  		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

}
