package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


import net.sf.json.JSONObject;

@ServerEndpoint("/websocket/{info}")
public class WebSocketServlet {
	private static SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
	//房间map，线程安全，可动态添加，自动删除
	private static ConcurrentHashMap<String, ConcurrentHashMap<String,WebSocketServlet>> roomList = new ConcurrentHashMap<String, ConcurrentHashMap<String,WebSocketServlet>>();
	//标识用户是否是重新登陆的，选择是否重新加入房间
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
		System.out.print(roomList);
	}
	
	
	public void joinRoom(String room,String user) {
		ConcurrentHashMap<String, WebSocketServlet> r = roomList.get(room);
		if(r.get(user)!=null) {
			this.rejoin = 1;
		}
		r.put(user, this);
	}
	
	//发送对应的消息到用户
	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);	
	}
	
	@OnMessage
	public void onMessage(String message,Session session) throws Exception {
		//将发来的消息解析为json数据
		JSONObject object = JSONObject.fromObject(message);
		if(object.get("flag").toString().equals("exitroom")) {
			//将用户移除
			String roomid = object.get("roomid").toString();
			roomList.get(roomid).remove(object.get("nickname").toString());
			
			if(roomList.get(roomid).size() == 0) {
				roomList.remove(roomid);
			}
		}
		else if(object.get("flag").toString().equals("chatroom")){		//聊天室的消息 加入房间/发送消息
			//向JSON对象中添加发送时间
			object.put("date", df.format(new Date()));
			//获取客户端发送的数据中的内容---房间�? 用于区别该消息是来自于哪个房间
			String roomid = object.get("target").toString();
			//获取客户端发送的数据中的内容---用户
			String username = object.get("nickname").toString();
			//从房间列表中定位到该房间
			ConcurrentHashMap<String, WebSocketServlet> r =roomList.get(roomid);
			List<String> uname = new ArrayList<String>();
			for(String u:r.keySet()){
				uname.add(u);
			}
			object.put("uname", uname.toArray());
			if(r.get(username).rejoin == 0){			//证明不是退出重连
				for(String i:r.keySet()){  //遍历该房间
					object.put("isSelf", username.equals(i));//设置消息是否为自己的
					r.get(i).sendMessage(object.toString());//调用方法 将消息推送
				}
			}else{
				object.put("isSelf", true);
				r.get(username).sendMessage(object.toString());
			}
			r.get(username).rejoin = 0;
		}
		System.out.print(roomList);
	}
	/**
	 * 用户断开
	 * @param session
	 */
	@OnClose
	public void onClose(Session session){
		System.out.print(roomList);
	}
	
	/**
	 * 用户连接异常
	 * @param t
	 */
	@OnError
	public void onError(Throwable t){
		System.out.print(roomList);
	}
	
	
	
	
	
	
	
	
	
	
}
















