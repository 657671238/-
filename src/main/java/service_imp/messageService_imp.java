package service_imp;

import java.text.SimpleDateFormat;
import java.util.Date;

import bean.message;
import dao.messageDao;
import dao_imp.messageDao_imp;
import service.messageService;

public class messageService_imp implements messageService {

	public boolean addmessage(message m) {
		// TODO Auto-generated method stub
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		m.setDate(s.format(new Date()));
		messageDao md = new messageDao_imp();
		return md.addmessage(m);
	}

}
