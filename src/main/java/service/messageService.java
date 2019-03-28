package service;

import java.util.List;

import bean.emailRead;
import bean.message;

public interface messageService {
	public boolean addmessage(message m);
	public List<message> selectAllMessage(int roomid);
	public boolean changestate(String room,String user);//登录时读取所有未读消息
	List<emailRead> getreadlist(String user);	//读取列表信息以及未读消息的条数

}
