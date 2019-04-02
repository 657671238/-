package bean;

public class emailRead {
	//消息列表需要展示的，包括房间id，已读未读消息条数，发送方的详细消息，最后一条消息的内容以及时间
	private int roomid;
	private int readed;
	private int noread;
	private String othername;
	private String otherId;
	private String image;
	private String lastmessage;
	private String messageDate;
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public int getNoread() {
		return noread;
	}
	public void setNoread(int noread) {
		this.noread = noread;
	}
	public String getOthername() {
		return othername;
	}
	public void setOthername(String othername) {
		this.othername = othername;
	}
	public String getOtherId() {
		return otherId;
	}
	public void setOtherId(String otherId) {
		this.otherId = otherId;
	}
	public String getLastmessage() {
		return lastmessage;
	}
	public void setLastmessage(String lastmessage) {
		this.lastmessage = lastmessage;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	
}
