package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import bean.User;
import dao.userDao;
import dao_imp.userDao_imp;
import service.userService;
import service_imp.userService_imp;
import util.StringUUID;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//设置接受以及返回编码
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		//判断是否是文件上传的表单
		if(ServletFileUpload.isMultipartContent(req)){
			Map<String,Object> paraMap = new HashMap<String,Object>();
			DiskFileItemFactory cache = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(cache);
			upload.setHeaderEncoding("UTF-8");  //设置返回头部编码UTF-8
			try {
				@SuppressWarnings("unchecked")  //禁用感叹号报错
				List<FileItem> fileItems = upload.parseRequest(req);
				for(FileItem item:fileItems) {
					if(item.isFormField()) { //是否是普通表单数据
						paraMap.put(item.getFieldName(), item.getString("UTF-8"));
					}else {
						//创建文件输入流
						InputStream inStream = item.getInputStream();
						//判断文件是否存在
						if(inStream.available()>0) {
							//使用  UUID 创建随机文件名
							String tempFileName = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss_sss").format(new java.util.Date());
							String fileName = tempFileName+StringUUID.getUUID();
							//得到文件类型
							String MIME = item.getContentType();
							//System.out.println("MIME:"+MIME);
							int index = MIME.lastIndexOf("/");
							if(index!=-1) {
								fileName +="."+MIME.substring(index+1);
							}
							//System.out.println("文件名:"+fileName);
							//保存文件到指定路径
							String path = StringUUID.getUploadDir();
							OutputStream outStream = new FileOutputStream(path+fileName);
							IOUtils.copy(inStream, outStream);
							inStream.close();
							outStream.close();
							item.delete();
							String originalPro_image = (String) paraMap.get("image");
							paraMap.put("image", fileName);
							
							//删除以前的旧文件
							String originalFileName = path+originalPro_image;
							
							//System.out.println("originalFileName:"+originalFileName);
							File tempFile = new File(originalFileName);
							if(tempFile.delete()) {
								System.out.println("删除成功");
							}else {
								System.out.println("删除失败");
							}
						}	
					}
				}
				//将map映射到us实例
				User us = new User();
				BeanUtils.populate(us, paraMap);
				//添加user到数据库
				//System.out.println(us);
				userDao dao = new userDao_imp();
				if(dao.updateUser(us)) {
					//完成所有逻辑后转发
					resp.sendRedirect("myMessageServlet");		
				}else {
					//JSONResult.JSONReturnWithData("4", "�������ݿ�ʧ��", response);
				}				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				//JSONResult.JSONReturnWithData("3", "���������쳣", response);
			} 
		}else {
		   //JSONResult.JSONReturnWithData("2", "�ϴ������ݲ��Ƕ��ļ��ı�", response);	
		}

/*		String phoneNumber = req.getParameter("phoneNumber");
		String name = req.getParameter("name");
		String school = req.getParameter("school");
		String date = req.getParameter("birth");
		// System.out.println(date);
		User user = new User();
		user.setName(name);
		user.setPhoneNumber(phoneNumber);
		user.setSchool(school);
		try {
			Date d1 = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime());
			user.setBirth(d1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block

			System.out.println("转换错误！");
		}
		userService us = new userService_imp();
		boolean updateSuccess = us.updateUser(user);
		// System.out.println(updateSuccess);
		if (updateSuccess) {
			resp.sendRedirect("myMessageServlet");
		}*/

	}

}
