package service_imp;

import java.util.List;

import bean.task;
import dao.requestDao;
import dao.taskDao;
import dao_imp.requestDao_imp;
import dao_imp.taskDao_imp;
import service.requestService;
import service.taskService;

public class taskService_imp implements taskService {

	public List<task> queryall() {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.queryall();
	}

	public boolean addtask(task t) {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.addtask(t);
	}

	public boolean isMytask(int taskId, String phoneNumber) {
		// TODO Auto-generated method stub
		taskDao ts = new taskDao_imp();
		String pushman = ts.getPushPerson(taskId);
		if(phoneNumber.equals(pushman)) {
			return true;
		}
		return false;
	}

	public task queryone(int id) {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.queryone(id);
	}

	public boolean deletetask(int id) {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		boolean delTaskSuccess = td.deletetask(id);
		requestDao rs = new requestDao_imp();
		boolean delRequest = rs.deleteRequests(id);
		if(delTaskSuccess&&delRequest) {
			return true;
		}
		return false;
	}

	public boolean updatetask(task t) {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.updatetask(t);
	}

	public List<task> queryallselectedtask(String phone) {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.queryallselectedtask(phone);
	}

	public List<task> queryallmytask(String id) {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.queryallmytask(id);
	}

}
