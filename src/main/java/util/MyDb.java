package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.catalina.valves.rewrite.Substitution.StaticElement;

public class MyDb {
	private  Connection conn = null;
	private PreparedStatement pst = null;
	private static MyDb myDb = null;
	private MyDb() throws Exception{
		// TODO Auto-generated constructor stub
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/bountytack?characterEncoding=utf-8";
		String username = "root";
		String password = "123456";
		conn = DriverManager.getConnection(url, username, password);
	
	}
	public static MyDb getMyDb() throws Exception{
		if(myDb==null) {
			myDb = new MyDb();
		}
		return myDb;
	}
	public ResultSet query(String sql, Object... args) throws Exception{
		pst = conn.prepareStatement(sql);
		for(int i=0;i < args.length;i++) {
			pst.setObject(i+1,args[i]);
		}
		return pst.executeQuery();
	}
	public boolean cud(String sql, Object... args) throws Exception { // 增加_c，修改_u，删除_d
		pst = conn.prepareStatement(sql);
		for (int i = 0; i < args.length; i++) {
			pst.setObject(i + 1, args[i]);
		}
		return pst.executeUpdate() >= 1 ? true : false; // 返回操作查询是否成功？
	}
	public void closeConn() throws Exception { // 关闭数据库访问方法
		if (pst != null && !pst.isClosed())
			pst.close();
		if (conn != null && !conn.isClosed())
			conn.close();
	}	
}
