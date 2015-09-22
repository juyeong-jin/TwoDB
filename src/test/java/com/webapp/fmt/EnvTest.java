package com.webapp.fmt;

import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

public class EnvTest {

	public static void main(String[] args) {
		
		Map<String, String> env = System.getenv();
		for (Entry<String, String> entry : env.entrySet()) {
			System.out.println(entry.getKey() + "=" + entry.getValue());
		}
	    System.out.println("#################################");
		Properties prop = System.getProperties();
		for (Entry<Object, Object> entry : prop.entrySet()) {
			System.out.println(entry.getKey() + "=" + entry.getValue());
	}

	}
}