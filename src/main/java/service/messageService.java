package service;

import java.util.List;

import bean.message;

public interface messageService {
	public boolean addmessage(message m);
	public List<message> selectAllMessage(int roomid);
}
