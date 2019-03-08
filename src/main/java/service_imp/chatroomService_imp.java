package service_imp;

import bean.User;
import bean.chatroom;
import dao.chatroomDao;
import dao.userDao;
import dao_imp.chatroomDao_imp;
import dao_imp.userDao_imp;
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

	public String getPic(String us) {
		// TODO Auto-generated method stub
		//获取用户头像
		userDao ud = new userDao_imp();
		User u = ud.queryone(us);
		return u.getImage();
	}

}
