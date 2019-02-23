package bean;

import java.sql.Date;

public class request {
	private int publishPhone;
	private int myPhone;
	private int taskId;
	private Date requestDate;
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public int getPublishPhone() {
		return publishPhone;
	}
	public void setPublishPhone(int publishPhone) {
		this.publishPhone = publishPhone;
	}
	public int getMyPhone() {
		return myPhone;
	}
	public void setMyPhone(int myPhone) {
		this.myPhone = myPhone;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	
}
