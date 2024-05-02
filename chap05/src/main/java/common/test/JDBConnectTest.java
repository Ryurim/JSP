package common.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.Assert;
import org.junit.jupiter.api.Test;

import common.JDBConnect;

class JDBConnectTest {

	@Test
	void testJDBConnect() {
		//fail("Not yet implemented");
		JDBConnect jdbc = new JDBConnect();
		Assert.assertNotNull(jdbc); //성공
	}

	@Test
	void testJDBConnectStringStringStringString() {
		fail("Not yet implemented");
	}

	@Test
	void testJDBConnectServletContext() {
		fail("Not yet implemented");
	}

	@Test
	void testClose() {
		fail("Not yet implemented");
	}

}
