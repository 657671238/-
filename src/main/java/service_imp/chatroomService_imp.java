package service_imp;

import bean.chatroom;
import dao.chatroomDao;
import dao_imp.chatroomDao_imp;
import service.chatroomService;

public class chatroomService_imp implements chatroomService {

	public int addchatroom(chatroom c) {
		// TODO Auto-generated method stub
		chatroomDao cd = new chatroomDao_imp();
		if(cd.getroomid(c)==-1) {
			if(cd.addchatroom(c)) {
				return cd.getroomid(c);
			}
		}
		return cd.getroomid(c);
	}

}
