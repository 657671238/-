package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.filters.CsrfPreventionFilter;

import bean.chatroom;
import bean.request;
import bean.task;
import service.chatroomService;
import service.taskService;
import service_imp.chatroomService_imp;
import service_imp.taskService_imp;

@WebServlet("/trytochatroomServlet")
public class trytochatroomServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String us = (String) session.getAttribute("username");
		if (us == null) {
			req.getRequestDispatcher("/pleaselogin.jsp").forward(req, resp);
			return;
		}
		String chatperson = req.getParameter("phone");
		chatroom c = new chatroom();
		c.setPerson_1(us);
		c.setPerson_2(chatperson);
		//生成聊天室的id
		chatroomService cs = new chatroomService_imp();
		int roomid = cs.addchatroom(c); 
		String roomid1 = roomid+"";
		//发送头像地址
		String us_pic = cs.getPic(us);
		String him_pic = cs.getPic(chatperson);
		req.setAttribute("us_img", us_pic);
		req.setAttribute("him_img", him_pic);
		System.out.println("房间号："+roomid);
		if(roomid>-1) {
			System.out.println("成功进入房间");
			req.getRequestDispatcher("/room.jsp?roomid="+roomid1+"&uname="+us).forward(req, resp);
		}
	}

}
