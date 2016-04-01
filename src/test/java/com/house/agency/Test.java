package com.house.agency;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.house.agency.entity.User;
import com.house.agency.service.IUserService;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("application-web.xml");  
		IUserService api = (IUserService) ac.getBean("userService");
		User user = api.getDataById("1870dc153c592f7578000");
		System.out.println("done=" + user);
	}

}
