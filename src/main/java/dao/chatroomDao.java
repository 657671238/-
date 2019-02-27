package dao;

import bean.chatroom;

public interface chatroomDao {
	//添加聊天室
	boolean addchatroom(chatroom c);
	//获得房间id，根据双方phone
	int getroomid(chatroom c);

}
