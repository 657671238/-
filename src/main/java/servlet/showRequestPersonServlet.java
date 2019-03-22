package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import bean.task;
import service.requestService;
import service.taskService;
import service.userService;
import service_imp.requestService_imp;
import service_imp.taskService_imp;
import service_imp.userService_imp;

/**
 * Servlet implementation class showRequestPersonServlet
 */
@WebServlet("/showRequestPersonServlet")
public class showRequestPersonServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String us = (String) session.getAttribute("username");
		if (us == null) {
			request.getRequestDispatcher("/pleaselogin.jsp").forward(request, response);
			return;
		}
		String taskId = request.getParameter("taskId");
		int taskid = Integer.parseInt(taskId);
		requestService rs = new requestService_imp();
		List<bean.request> ls = rs.queryAllRequest(taskid);
		request.setAttribute("requestsList", ls);
		taskService uss = new taskService_imp();
		task u = uss.queryone(taskid);
		request.setAttribute("needP_num", u.getNeedP_num());
		request.getRequestDispatcher("/showRequestsList.jsp").forward(request, response);
	
	}

}
