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



@WebServlet("/showTaskServlet")
public class showTaskServlet extends HttpServlet {
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
		System.out.printf(taskId);
		taskService ts = new taskService_imp();
		boolean ismyTask = ts.isMytask(task_Id, us);
		//此处分开判断是为了在我的任务栏目中避免判断逻辑
		System.out.println(ismyTask);
		if(ismyTask) {
			req.getRequestDispatcher("showMyTaskServlet").forward(req, resp);
			return;
		}
		task task = ts.queryone(task_Id);
		req.setAttribute("task", task);
		req.getRequestDispatcher("/showOtherTask.jsp").forward(req, resp);
	}

}
