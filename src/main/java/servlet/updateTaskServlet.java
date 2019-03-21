package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

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
		
		taskService ts = new taskService_imp();
		task t = new task();
		t.setId(Integer.parseInt(req.getParameter("id")));
		t.setTaskTitle(req.getParameter("taskTitle"));
		t.setTaskBody(req.getParameter("taskBody"));
		t.setBounty(Integer.parseInt(req.getParameter("bounty")));
		t.setPlace(req.getParameter("place"));
		t.setPushPhone(us);
		t.setState(req.getParameter("state"));
		t.setPublishDate(req.getParameter("publishDate"));
		t.setPlace(req.getParameter("place"));
		t.setLng(req.getParameter("lng"));
		t.setLat(req.getParameter("lat"));
		t.setNeedP_num(req.getParameter("needP_num"));
		t.setTime_desc(req.getParameter("time_desc"));

		boolean updateTasksuccess = ts.updatetask(t);
		if (updateTasksuccess) {
			req.getRequestDispatcher("selectableTasksServlet").forward(req, resp);
		}
		
	}
}
