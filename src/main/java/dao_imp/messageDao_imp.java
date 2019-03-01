package dao_imp;

import bean.message;
import dao.messageDao;
import util.MyDb;

public class messageDao_imp implements messageDao {

	public boolean addmessage(message m) {
		// TODO Auto-generated method stub
		try {
			String sql = "insert into messages(phone ,roomid ,text,date) value(?,?,?,?)";
			boolean successAdd = MyDb.getMyDb().cud(sql, m.getPhone(),m.getRoomid(),m.getText(),m.getDate());
			return successAdd;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

}
