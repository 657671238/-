package servlet;

import java.io.IOException;

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

@WebServlet("/updateTaskServlet")
public class updateTaskServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String us = (String) session.getAttribute("username");
		if (us == null) {
			req.getRequestDispatcher("/pleaselogin.jsp").forward(req, resp);
			return;
		}
		String id = req.getParameter("id");
		String date = req.getParameter("date");
		String state = req.getParameter("state");
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		String bounty = req.getParameter("bounty");
		// System.out.println(date);
		task task = new task();
		int bounty1 = Integer.parseInt(bounty);
		int id1 = Integer.parseInt(id);
		task.setBounty(bounty1);
		task.setId(id1);
		task.setPublishDate(date);
		task.setPushPhone(us);
		task.setState(state);
		task.setTaskTitle(title);
		task.setTaskBody(body);
		taskService ts = new taskService_imp();
		boolean updateTasksuccess = ts.updatetask(task);
		if (updateTasksuccess) {
			req.getRequestDispatcher("selectableTasksServlet").forward(req, resp);
		}
		
	}
}
