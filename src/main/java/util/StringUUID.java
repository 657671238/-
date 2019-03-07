package util;

import java.util.UUID;

public class StringUUID {
	
	public static String getUUID() {
		
	     String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(12, 32);
	     System.out.println(uuid);
		 return uuid;
	}
	
	public static  String getUploadDir() {
         return "C:\\upload\\";
	}

}
