package dao_imp;

import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.interceptors.ServerStatusDiffInterceptor;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import bean.task;
import dao.taskDao;
import util.MyDb;

public class taskDao_imp implements taskDao {

	public boolean addtask(task t) {
		// TODO Auto-generated method stub
		try {
			String sql = "insert into tasks(taskTitle,taskBody,publishDate,pushPhone,state,bounty,place) value(?,?,?,?,?,?,?)";
			boolean addtaskSuccess = MyDb.getMyDb().cud(sql, t.getTaskTitle(),t.getTaskBody(),t.getPublishDate(),
			t.getPushPhone(),t.getState(),t.getBounty(),t.getPlace());
			return addtaskSuccess;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean updatetask(task t) {
		// TODO Auto-generated method stub
		try {
			String sql = "update tasks set taskTitle=? ,taskBody=? ,bounty =? where id=?";
			boolean successupdate = MyDb.getMyDb().cud(sql,t.getTaskTitle(),t.getTaskBody(),t.getBounty(),t.getId());
			return successupdate;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean deletetask(int id) {
		// TO.DO Auto-generated method stub
		try {
			String sql = "delete from tasks where id=?";
			boolean successdel = MyDb.getMyDb().cud(sql, id);
			return successdel;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	

	public List<task> queryall() {
		// TODO Auto-generated method stub
		List<task> tasklist = new ArrayList<task>();
		try {
			String sql = "select *  from tasks order by publishDate desc";
			ResultSet alltasks = MyDb.getMyDb().query(sql);
			while (alltasks.next()) {
				task t = new task();
				t.setId(alltasks.getInt("id"));
				t.setTaskTitle(alltasks.getString("taskTitle"));
				t.setTaskBody(alltasks.getString("taskBody"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				t.setPublishDate(alltasks.getString("publishDate"));
				t.setPushPhone(alltasks.getString("pushPhone"));
				t.setState(alltasks.getString("state"));
				t.setBounty(alltasks.getInt("bounty"));
				tasklist.add(t);
			}
			return tasklist;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tasklist;
	}

	public String getPushPerson(int taskId) {
		// TODO Auto-generated method stub
		String phoneNumber = new String();
		try {
			String sql = "select pushPhone from tasks where id=?";
			ResultSet rs = MyDb.getMyDb().query(sql, taskId);
			if(rs.next()) {
				phoneNumber = rs.getString("pushPhone");
			}
			return phoneNumber;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return phoneNumber;
	}

	public task queryone(int id) {
		// TODO Auto-generated method stub
		task t = new task();
		t.setId(id);
		try {
			String sql = "select * from tasks where id=?";
			ResultSet rs = MyDb.getMyDb().query(sql, id);
			if(rs.next()) {
				t.setTaskTitle(rs.getString("taskTitle"));
				t.setTaskBody(rs.getString("taskBody"));
				t.setPublishDate(rs.getString("publishDate"));
				t.setPushPhone(rs.getString("pushPhone"));
				t.setState(rs.getString("state"));
				t.setBounty(rs.getInt("bounty"));
			}
			return t;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return t;
	}

	public boolean changeState(int id) {
		// TODO Auto-generated method stub
		int state = this.queryState(id);
		try {
			String sql = "update tasks set state =? where id =?";
			boolean successChange = MyDb.getMyDb().cud(sql, state+1, id);
			return successChange;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public int queryState(int id) {
		try {
			String sql = "select state from tasks where id =?";
			ResultSet rs = MyDb.getMyDb().query(sql, id);
			rs.next();
			int state = rs.getInt("state");
			return state;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

}





















