package com.webapp.fmt;

import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

public class PropertiesTest {

	public static void main(String[] args) {
		
		Properties prop = new Properties();
		InputStream inStream = PropertiesTest.class
											.getClassLoader()
											.getResourceAsStream("msg/message_ko .properties");
		try {
			prop.load(inStream);
			String value = prop.getProperty("log4j.rootLogger");
			System.out.println(value);
		
			for (Entry<Object, Object> entry : prop.entrySet()) {
				System.out.println(entry.getKey() + "=" + entry.getValue());
		}

			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}