package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.task;
import service.taskService;
import service_imp.taskService_imp;

@WebServlet("/addTaskServlet")
public class addTaskServlet extends HttpServlet {
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
		req.setCharacterEncoding("UTF-8");

		taskService ts = new taskService_imp();
		task t = new task();
		t.setTaskTitle(req.getParameter("taskTitle"));
		t.setTaskBody(req.getParameter("taskBody"));
		t.setBounty(Integer.parseInt(req.getParameter("bounty")));
		t.setPlace(req.getParameter("place"));
		t.setPushPhone(us);
		t.setState("0");
		t.setPublishDate(new Date(new java.util.Date().getTime()));
		
		boolean addtaskSuccess = ts.addtask(t);
		System.out.println(addtaskSuccess);
		if (addtaskSuccess) {
			System.out.println("添加成功");
			req.setAttribute("addMessage", "add success!");
			req.getRequestDispatcher("/publishTasks.jsp").forward(req, resp);
		}
	}
}
