package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.task;
import service.taskService;
import service.userService;
import service_imp.taskService_imp;
import service_imp.userService_imp;

@WebServlet("/selectableTasksServlet")
public class selectableTasksServlet extends HttpServlet {
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
		taskService ts = new taskService_imp();
		List<task> tasklist = ts.queryall();
		userService uss = new userService_imp();
		List<task> tasklists = uss.querytaskbody(tasklist);
		req.setAttribute("tasklist", tasklists);
		req.getRequestDispatcher("/selectableTasks.jsp").forward(req, resp);
		
	}

}
