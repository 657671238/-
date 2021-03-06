package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service_imp.userService_imp;
import util.MD5_String;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取前台输入的账号密码并进行加密
		String userName=req.getParameter("userName");
		String password=req.getParameter("password");
		//System.out.println(userName+password);
		password=new MD5_String().encryption(password);
		//System.out.println(password);
		userService us = new userService_imp();
		
		boolean success=us.addUser(userName, password);
		//将添加结果返回到前台
		//System.out.println(success);
		req.setAttribute("message1", success);

		req.getRequestDispatcher("registerpage.jsp").forward(req, resp);
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
}
