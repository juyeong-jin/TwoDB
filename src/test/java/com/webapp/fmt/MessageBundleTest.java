package com.webapp.fmt;

import java.util.Locale;

public class MessageBundleTest {

	public static void main(String[] args) {
		MessageBundle bundle = new MessageBundle("message");
		
//		Locale.setDefault(Locale.JAPANESE);
		Locale.setDefault(Locale.CHINESE);
		
		String greeting = bundle.getMessage("greeting");
		String body = bundle.getMessage("body");
		System.out.println(greeting);
		System.out.println(body);
	}

}
