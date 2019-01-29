package service_imp;

import java.util.List;

import bean.task;
import dao.taskDao;
import dao_imp.taskDao_imp;
import service.taskService;

public class taskService_imp implements taskService {

	public List<task> queryall() {
		// TODO Auto-generated method stub
		taskDao td = new taskDao_imp();
		return td.queryall();
	}

}
