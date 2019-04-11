package service_imp;

import java.util.List;

import com.sun.net.httpserver.Authenticator.Success;

import bean.User;
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
		boolean delRequest = rs.delchangestate(-1, id);
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

	public boolean changestate(int state) {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.changeState(state);
	}
	/*委派逻辑：
	将列表中的人对应请求改为1，其余改为2，将任务状态改为-1；代表正在进行*/
	public boolean delegate(int task_id, String[] users) {
		// TODO Auto-generated method stub
		requestDao rd = new requestDao_imp();
		boolean success1 = rd.changeusersState(task_id, users);
		boolean success3 = rd.changeotherState(task_id);
		taskDao td = new taskDao_imp();
		boolean success2 = td.changeState(task_id, -1);
		if (success2&&success1) {
			return true;
		}
		return false;
	}
	public int requesttaskstate(int id) {
		taskDao rd = new taskDao_imp();
		return rd.queryState(id);
	}

	public List<User> getallrequestPerson(int taskid) {
		// TODO Auto-generated method stub
		taskDao tDao = new taskDao_imp();
		return tDao.queryallrequestPerson(taskid);
	}
}





