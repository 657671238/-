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
import service.taskService;
import service_imp.taskService_imp;

@WebServlet("/showMypublishTaskServlet")
public class showMypublishTaskServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String us = (String) session.getAttribute("username");
		if (us == null) {
			req.getRequestDispatcher("/pleaselogin.jsp").forward(req, resp);
			return;
		}
		//获得任务详细信息
		String taskId = req.getParameter("taskId");
		int task_Id = Integer.parseInt(taskId);
		taskService ts = new taskService_imp();
		task task = ts.queryone(task_Id);
		req.setAttribute("task", task);
		
		//获取任务的请求人员列表
		List<User> users = ts.getallrequestPerson(task_Id);
		req.setAttribute("users", users);
		req.getRequestDispatcher("/showMypublishTask.jsp").forward(req, resp);

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

}
