package dao;

import java.util.List;

import bean.message;

public interface messageDao {
	//添加消息
	boolean addmessage(message m);
	
	//选出房间所有历史消息
	List<message> selectAllMessage(int roomid);
}
