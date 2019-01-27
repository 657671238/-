package service_imp;

import java.io.IOException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import service.smsService;

public class smsService_imp implements smsService {

	public String sendMessage(String phoneNumber)  {
		int message=(int)(1000+Math.random()*9000);
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
		NameValuePair[] data ={ new NameValuePair("Uid", "xukang123"),new NameValuePair("Key", "d41d8cd98f00b204e980"),new NameValuePair("smsMob",phoneNumber),new NameValuePair("smsText","验证码："+message)};
		post.setRequestBody(data);
		try {
			client.executeMethod(post);

		
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers)
		{
		System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 

		System.out.println(result); //打印返回消息状态
		post.releaseConnection();
				} catch (Exception e) {
			// TODO: handle exception
		}
		return ""+message;
	}

}
