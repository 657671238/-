package bean;

import java.sql.Date;

public class task {

	private int id;//任务编号
	private String taskTitle;//任务标题
	private String taskBody;//任务内容
	private String pushPhone;//发布人电话
	private Date publishDate;//发布日期
	private String state;//任务状态
	private int bounty;//赏金数量
	private String place;//任务地点
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTaskTitle() {
		return taskTitle;
	}
	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}
	public String getTaskBody() {
		return taskBody;
	}
	public void setTaskBody(String taskBody) {
		this.taskBody = taskBody;
	}
	public String getPushPhone() {
		return pushPhone;
	}
	public void setPushPhone(String pushPhone) {
		this.pushPhone = pushPhone;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getBounty() {
		return bounty;
	}
	public void setBounty(int bounty) {
		this.bounty = bounty;
	}
	public String show() {
		return "标题:"+taskTitle+".内容:"+taskBody+"发布人电话："
				+pushPhone+".发布时间:"+publishDate+".任务状态:"+state;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
}
