package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.request;
import service.requestService;
import service_imp.requestService_imp;

@WebServlet("/requestTaskServlet")
public class requestTaskServlet extends HttpServlet {
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
		String taskId = req.getParameter("id");
		int taskid = Integer.parseInt(taskId);
		String publishPhone = req.getParameter("phone");
		request request = new request();
		request.setMyPhone(us);
		request.setPublishPhone(publishPhone);
		request.setTaskId(taskid);
		Date dt = new Date();
		java.sql.Date date = new java.sql.Date(dt.getTime());
		(request).setRequestDate(date);
		requestService rs = new requestService_imp();
		rs.requestTask(request);
	}

}
