package bean;

import java.sql.Date;

public class request {
	private String publishPhone;
	private String myPhone;
	private int taskId;
	private String requestDate;
	private int state;
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getPublishPhone() {
		return publishPhone;
	}
	public void setPublishPhone(String publishPhone) {
		this.publishPhone = publishPhone;
	}
	public String getMyPhone() {
		return myPhone;
	}
	public void setMyPhone(String myPhone) {
		this.myPhone = myPhone;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
