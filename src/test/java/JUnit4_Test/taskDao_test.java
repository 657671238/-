package JUnit4_Test;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;

import bean.task;
import dao_imp.taskDao_imp;

public class taskDao_test {

	
	@Test
	public void testAddtask() {
		task t = new task();
		t.setBounty(50);
		t.setTaskTitle("hellp");
		t.setPushPhone("15871871061");
		t.setState("0");
		t.setTaskBody("帮我买一瓶矿泉水");
		t.setPublishDate(new java.sql.Date(new Date().getTime()));
		boolean addtaskSuccess = new taskDao_imp().addtask(t);
		System.out.println(addtaskSuccess);
	}

	@Test
	public void testUpdatetask() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeletetask() {
		fail("Not yet implemented");
	}

}
