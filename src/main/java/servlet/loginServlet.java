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
		String un=req.getParameter("userName");
		String pwd=req.getParameter("password");
		pwd = new MD5_String().encryption(pwd);
		userDao us = new userDao_imp();
		boolean isexist=us.isexist(un,pwd);
		if(!isexist) {
			HttpSession session=req.getSession();
			session.setAttribute("username", un);
			resp.sendRedirect("mainServlet");
		}
		else {
			req.setAttribute("message", "账号或密码错误");
			req.getRequestDispatcher("/index.jsp").forward(req,resp);
		}
	}

}
