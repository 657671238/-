package dao_imp;

import java.sql.ResultSet;

import bean.chatroom;
import dao.chatroomDao;
import util.MyDb;

public class chatroomDao_imp implements chatroomDao {

	public boolean addchatroom(chatroom c) {
		// TODO Auto-generated method stub
		try {
			String sql = "insert into chatroom(person_1,person_2) value(?,?)";
			boolean addsuccess = MyDb.getMyDb().cud(sql, c.getPerson_1(),c.getPerson_2());
			return addsuccess;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public int getroomid(chatroom c) {
		// TODO Auto-generated method stub
		try {
			String sql = "select roomid from chatroom where (person_1 = ? and person_2 =?) or (person_1 = ? and person_2 =?)";
			ResultSet rs = MyDb.getMyDb().query(sql, c.getPerson_1(),c.getPerson_2(),c.getPerson_2(),c.getPerson_1());
			if(rs.next()) {
				return rs.getInt("roomid");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}

}
