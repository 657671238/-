package bean;

import java.sql.Date;

public class User {
	/*用于存储用户信息，(一下表示在展示请求人员时添加的逻辑功能：state表示用户完成任务的状态，date表示用户请求的时间)
	 */
	private String phoneNumber;
	private String pwd;
	private String name;
	private String school;
	private Date birth;
	private String image;
	private String state;
	private String date;
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String pn,String pwd) {
		// TODO Auto-generated method stub
		this.phoneNumber=pn;
		this.pwd=pwd;
	}
	public String tostring() {
		return "User [phoneNumber=" + phoneNumber + ", password=" + pwd
				+ ", name=" + name + ", school =" + school
				+ ", birth" + birth + "]";
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
