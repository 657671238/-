package dao_imp;

import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

import bean.task;
import dao.taskDao;
import util.MyDb;

public class taskDao_imp implements taskDao {

	public boolean addtask(task t) {
		// TODO Auto-generated method stub
		try {
			String sql = "insert into tasks(taskTitle,taskBody,publishDate,pushPhone,state,bounty) value(?,?,?,?,?,?)";
			boolean addtaskSuccess = MyDb.getMyDb().cud(sql, t.getTaskTitle(),t.getTaskBody(),t.getPublishDate(),
			t.getPushPhone(),t.getState(),t.getBounty());
			return addtaskSuccess;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean updatetask(task t) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean deletetask(int id) {
		// TO.DO Auto-generated method stub
		return false;
	}

	public List<task> queryall() {
		// TODO Auto-generated method stub
		List<task> tasklist = new ArrayList<task>();
		try {
			String sql = "select * from tasks";
			ResultSet alltasks = MyDb.getMyDb().query(sql,null);
			while (alltasks.next()) {
				task t = new task();
				t.setTaskTitle(alltasks.getString("taskTitle"));
				t.setTaskBody(alltasks.getString("taskBody"));
				t.setPublishDate(alltasks.getDate("publishDate"));
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

}
