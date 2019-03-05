package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import dao.userDao;
import dao_imp.userDao_imp;
import service.userService;
import service_imp.userService_imp;
import util.MD5_String;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] args=req.getParameterValues("checkbox");
		String un=req.getParameter("userName");
		String pwd1=req.getParameter("password");
		String pwd = new MD5_String().encryption(pwd1);
		userService us = new userService_imp();
		boolean isexist=us.isexist(un,pwd);
		if(isexist) {
			HttpSession session=req.getSession();
			session.setAttribute("username", un);
			req.setAttribute("message", "true");
			if(args==null||args.length==0){
				req.setAttribute("ischeck", "false");
			}
			else{
				req.setAttribute("ischeck", "true");
				req.setAttribute("username", un);
				req.setAttribute("pwd", pwd1);
			}
		}
		else {
			req.setAttribute("message", "false");
		}
		req.getRequestDispatcher("/index.jsp").forward(req,resp);
	}

}
