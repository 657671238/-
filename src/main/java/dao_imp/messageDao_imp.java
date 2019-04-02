package dao_imp;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.User;
import bean.emailRead;
import bean.message;
import dao.messageDao;
import dao.userDao;
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

	//查询readlist需要填充的数据，逻辑比较辅助
	public List<emailRead> getreadlist(String user) {
		// TODO Auto-generated method stub
		List<emailRead> erlist = new ArrayList<emailRead>();
		List<emailRead> erlist1 = new ArrayList<emailRead>();
		List<emailRead> erlist2 = new ArrayList<emailRead>();
		List<emailRead> erlist3 = new ArrayList<emailRead>();
		try {
			//查询message中消息条数，并分为以读与为读
			String sql = "SELECT m.roomid,count(case when state=0 and phone!=? then 1 END) as noread," + 
					"count(case when state=1 and phone!=? then 1 END) as readed " + 
					"from messages m ,chatroom c WHERE m.roomid=c.roomid and (c.person_1=? or c.person_2=?) GROUP BY m.roomid";
			ResultSet rs = MyDb.getMyDb().query(sql, user,user,user,user);
			while(rs.next()) {
				emailRead er = new emailRead();
				er.setRoomid(rs.getInt("roomid"));
				er.setNoread(rs.getInt("noread"));
				er.setReaded(rs.getInt("readed"));
				erlist.add(er);
			}
			//查询发送消息方的信息，id姓名图片等
			String sql1 = "select * from chatroom where roomid = ?";
			for(emailRead rl:erlist) {
				ResultSet r = MyDb.getMyDb().query(sql1, rl.getRoomid());
				r.next();
				if(r.getString("person_1").equals(user)) {
					rl.setOtherId(r.getString("person_2"));
				}else {
					rl.setOtherId(r.getString("person_1"));
				}
				erlist1.add(rl);
			}
			userDao ud = new userDao_imp();
			for(emailRead rd:erlist1) {
				User u = ud.queryone(rd.getOtherId());
				rd.setOthername(u.getName());
				rd.setImage(u.getImage());
				erlist2.add(rd);
			}
			//查询对应的最后一条消息以及发送时间
			String sql2 = "select a.* from messages a where date = (select max(date) from messages where roomid = ? and phone = ?)";
			for(emailRead rd:erlist2) {
				ResultSet rs1 = MyDb.getMyDb().query(sql2, rd.getRoomid(),rd.getOtherId());
				rs1.next();
				rd.setLastmessage(rs1.getString("text"));
				rd.setMessageDate(rs1.getString("date"));
				erlist3.add(rd);
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("messageDao_imp报错");
		}
		return erlist3;
	}

}














