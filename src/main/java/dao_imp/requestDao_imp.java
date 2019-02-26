package dao_imp;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.request;
import dao.requestDao;
import util.MyDb;

public class requestDao_imp implements requestDao {
	public boolean addRequest(request r) {
		if (!this.isAdd(r)) {
			System.out.print("未请求过");
			try {
				String sql = "insert into requests(task_ID,requestPhone,requestDate) value(?,?,?)";
				boolean successAddRequest = MyDb.getMyDb().cud(sql, r.getTaskId(), r.getMyPhone(), r.getRequestDate());
				return successAddRequest;
			} catch (Exception e) {
				// TODO: handle exception
			}
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
	
	public boolean deleteRequests(int id) {
		// TODO Auto-generated method stub
		try {
			String sql =  "delete from requests where task_Id = ?";
			boolean successDel = MyDb.getMyDb().cud(sql, id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public List<request> queryAllRequest(int taskId) {
		// TODO Auto-generated method stub
		List<request> list_request = new ArrayList<request>();
		try {
			String sql = "select * from requests where task_ID=?";
			ResultSet rs = MyDb.getMyDb().query(sql, taskId);
			while(rs.next()) {
				request r = new request();
				r.setState(rs.getInt("state"));
				r.setPublishPhone(rs.getString("requestPhone"));
				r.setRequestDate(rs.getString("requestDate"));
				r.setTaskId(taskId);
				list_request.add(r);
			}
			return list_request;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}

}
