package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.emailRead;
import service.messageService;
import service_imp.messageService_imp;

@WebServlet("/getemailsServlet")
public class getemailsServlet extends HttpServlet {
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
		
		messageService ms = new messageService_imp();
		List<emailRead> erlist = ms.getreadlist(us);
		for(emailRead e :erlist){
			System.out.println(e.getRoomid()+","+e.getReaded()+","+e.getNoread()+","+e.getOtherId());
		}
		
	}
	
}
