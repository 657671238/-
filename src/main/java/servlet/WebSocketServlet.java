package servlet;

import java.text.SimpleDateFormat;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/{info}")
public class WebSocketServlet {
	private static SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
	//房间map，线程安全，可动态添加，自动删除
	private static ConcurrentHashMap<String, ConcurrentHashMap<String,WebSocketServlet>> roomList = new ConcurrentHashMap<String, ConcurrentHashMap<String,WebSocketServlet>>();
	//标识用户是否重新登陆，选择是否重新加入房间
	private int rejoin = 0;
	//与某个客户端的会话，通过它来给客户端发送消息
	private Session session;
	
	@OnOpen
	public void onOpen(@PathParam(value="info")String param ,Session session) {
		this.session = session;
		String flag = param.split("[|]")[0];
		String room = param.split("[|]")[1];//获得roomid
		//动态创建房间
		if(roomList.get(room)==null) {
			roomList.put(room, new ConcurrentHashMap<String, WebSocketServlet>());		
		}
		if(flag.equals("join")) {
			String user = param.split("[|]")[2];//获得个人phone
			joinRoom(room,user);
		}
				
	}
	
	public void joinRoom(String room,String user) {
		ConcurrentHashMap<String, WebSocketServlet> r = roomList.get(room);
		if(r.get(user)!=null) {
			this.rejoin = 1;
		}
		
	}
}
