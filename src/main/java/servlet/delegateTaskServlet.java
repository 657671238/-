package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.taskDao;
import service.taskService;
import service_imp.taskService_imp;

@WebServlet("/delegateTaskServlet")
public class delegateTaskServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String us = (String) session.getAttribute("username");
		if (us == null) {
			req.getRequestDispatcher("/pleaselogin.jsp").forward(req, resp);
			return;
		}
		
		String taskid = req.getParameter("taskid");
		int task_id = Integer.parseInt(taskid);
		String[] users = req.getParameterValues("users");
		/*System.out.println(taskid);
		System.out.println(users.length);*/
		//System.out.println(users[0]);
		//委派任务逻辑：改变相应任务的请求状态，请求成功为1，失败为2，改变任务的状态为-1，表示进行中,-2表示已完成
		taskService ts = new taskService_imp();
		boolean successdelegate = ts.delegate(task_id, users);
		if(successdelegate) {
			System.out.println("任务委派成功");
		}
		
		
		
	}
}
