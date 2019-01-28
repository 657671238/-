package dao_imp;

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

}
