package dao_imp;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.message;
import dao.messageDao;
import util.MyDb;

public class messageDao_imp implements messageDao {

	public boolean addmessage(message m) {
		// TODO Auto-generated method stub
		try {
			String sql = "insert into messages(phone ,roomid ,text,date,state) value(?,?,?,?,?)";
			boolean successAdd = MyDb.getMyDb().cud(sql, m.getPhone(),m.getRoomid(),m.getText(),m.getDate(),m.getState());
			return successAdd;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public List<message> selectAllMessage(int roomid) {
		// TODO Auto-generated method stub
		List<message> l = new ArrayList<message>();
		try {
			String sql = "select * from messages where roomid = ? ORDER BY date";
			ResultSet rs = MyDb.getMyDb().query(sql, roomid);
			while (rs.next()) {
				message m = new message();
				m.setDate(rs.getString("date"));
				m.setPhone(rs.getString("phone"));
				m.setRoomid(roomid); 
				m.setText(rs.getString("text"));
				l.add(m);
			}
			return l;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return l;
	}

	public boolean change_all_state(int roomid, String user) {
		// TODO Auto-generated method stub
		boolean success = false;
		try {
			String sql = "update messages set state=1 where roomid = ? and phone != ?";
			success = MyDb.getMyDb().cud(sql, roomid , user);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

}
