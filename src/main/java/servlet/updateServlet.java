package servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import service.userService;
import service_imp.userService_imp;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String phoneNumber = req.getParameter("phoneNumber");
		String name = req.getParameter("name");
		String school = req.getParameter("school");
		String date = req.getParameter("birth");
		// System.out.println(date);
		User user = new User();
		user.setName(name);
		user.setPhoneNumber(phoneNumber);
		user.setSchool(school);
		try {
			Date d1 = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime());
			user.setBirth(d1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block

			System.out.println("转换错误！");
		}
		userService us = new userService_imp();
		boolean updateSuccess = us.updateUser(user);
		// System.out.println(updateSuccess);
		if (updateSuccess) {
			resp.sendRedirect("myMessageServlet");
		}

	}

}
