package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.message;
import net.sf.json.JSONArray;
import service.messageService;
import service_imp.messageService_imp;

@WebServlet("/getMessageJSONServlet")
public class getMessageJSONServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		messageService  ms = new messageService_imp();  
 
		response.setContentType("text/html;charset=UTF-8");
		
		String roomid = request.getParameter("roomid");
		int room_id = Integer.parseInt(roomid);
		
		try {
			 List<message> allmessage = ms.selectAllMessage(room_id);
			 System.out.println("这是查询的数据：");
			System.out.println(allmessage);
			 String resultStr = JSONArray.fromObject(allmessage).toString();
			 response.getWriter().write(resultStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write("{error:\"错误\"}");
		}
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
