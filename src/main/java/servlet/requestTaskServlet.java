package servlet;

import java.io.IOException;

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
		int publishphone = Integer.parseInt("publishPhone");
		request request = new request();
		int un = Integer.parseInt(us);
		request.setMyPhone(un);
		request.setPublishPhone(publishphone);
		request.setTaskId(taskid);
		requestService rs = new requestService_imp();
		
	}

}
