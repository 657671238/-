package servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.smsService;
import service_imp.smsService_imp;

//短信接口
@WebServlet("/smsServlet")
public class smsServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取得到的电话
		String phoneNumber=req.getParameter("phoneNumber");
		//System.out.printf(""+phoneNumber);
		
		smsService sms=new smsService_imp();
		
		//短信业务 测试可用
		//String message=sms.sendMessage(phoneNumber);
		
		req.setAttribute("message","1111");
		req.getRequestDispatcher("registerpage.jsp").forward(req, resp);

	}
}
