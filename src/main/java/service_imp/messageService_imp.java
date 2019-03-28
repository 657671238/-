package service_imp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import bean.emailRead;
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

	public List<message> selectAllMessage(int roomid) {
		// TODO Auto-generated method stub
		messageDao md = new messageDao_imp();
		return md.selectAllMessage(roomid);
	}

	public boolean changestate(String room, String user) {
		// TODO Auto-generated method stub
		int roomid = Integer.parseInt(room);
		messageDao md = new messageDao_imp();
		return md.change_all_state(roomid,user);
	}

	public List<emailRead> getreadlist(String user) {
		// TODO Auto-generated method stub
		messageDao md = new messageDao_imp();
		return md.getreadlist(user);
	}

}
