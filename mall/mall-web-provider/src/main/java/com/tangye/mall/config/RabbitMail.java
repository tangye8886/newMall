package com.tangye.mall.config;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.tangye.mall.utils.SendByEmailTools;

@Component
public class RabbitMail {

	@Autowired
	@Qualifier("serdbyemail")
	private SendByEmailTools service;
	
	
	  @RabbitListener(queues= {RabbitConfig.QUEUE_NAME}) 
	  public void getMsg(byte[] msg) 
	  { 
		  String sender="tanghongtao008@163.com";   //这个是发送人的邮箱
		  String rec=new String(msg);
		  String message=rec.substring(1,rec.length()-1);
		  String receiver=message.split(" ")[0];
		  String username=message.split(" ")[1];
		  String title="THT商城";    //标题
		  String text="恭喜你 "+username+"注册成功，您已成为我们THT商城的会员，期待以后的每一天都有你的到来哦。";
		  service.send(sender, receiver, title,text);
	  }

	
}
