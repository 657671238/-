package service_imp;
import bean.request;
import dao.requestDao;
import dao_imp.requestDao_imp;
import service.requestService;;

public class requestService_imp implements requestService {
	public boolean requestTask(request r){
		requestDao rd = new requestDao_imp();
		boolean successRequest = rd.addRequest(r);
		return successRequest;
	}

}
