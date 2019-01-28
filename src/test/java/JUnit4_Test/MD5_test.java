package JUnit4_Test;

import static org.junit.Assert.*;

import org.junit.Test;

import util.MD5_String;

public class MD5_test {

	@Test
	public void testEncryption() {
		System.out.println(new MD5_String().encryption("15871871061"));
	}

}
