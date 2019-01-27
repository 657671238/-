package JUnit4_Test;

import static org.junit.Assert.*;

import org.junit.Test;

import service_imp.smsService_imp;

public class smsService_impTest {

	@Test
	public void testSendMessage() {
		String string=new smsService_imp().sendMessage("15871871061");
	}

}
