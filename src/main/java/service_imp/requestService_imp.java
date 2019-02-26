package service_imp;
import java.util.List;

import bean.request;
import dao.requestDao;
import dao.taskDao;
import dao_imp.requestDao_imp;
import dao_imp.taskDao_imp;
import service.requestService;;

public class requestService_imp implements requestService {
	public boolean requestTask(request r){
		requestDao rd = new requestDao_imp();
		if(rd.isAdd(r)){
			return false;
		}
		boolean successRequest = rd.addRequest(r);
		taskDao td = new taskDao_imp();
		boolean successAddState = td.changeState(r.getTaskId());

		return true;
	}

	public List<request> queryAllRequest(int taskId) {
		// TODO Auto-generated method stub
		requestDao rd = new requestDao_imp();
		return rd.queryAllRequest(taskId);
	}



}
