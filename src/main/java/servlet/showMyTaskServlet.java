package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.task;
import service.taskService;
import service_imp.taskService_imp;



@WebServlet("/showMyTaskServlet")
public class showMyTaskServlet extends HttpServlet {
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
		String taskId = req.getParameter("taskId");
		int task_Id = Integer.parseInt(taskId);
		taskService ts = new taskService_imp();
		task task = ts.queryone(task_Id);
		req.setAttribute("task", task);
		req.getRequestDispatcher("/showMyTask.jsp").forward(req, resp);

	}

}
