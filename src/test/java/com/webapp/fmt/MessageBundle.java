package com.webapp.fmt;

import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.Properties;

public class MessageBundle {

	String basename;
	
	public MessageBundle(String basename) {
		this.basename = basename;
	}
	
	public String getMessage(String key) {
		Locale def = Locale.getDefault();
		String propfile = basename+"_"+def.getLanguage()+".properties";
		String value = null;
		
		Properties prop = new Properties();
		
		try {
			
			InputStream in = this.getClass().getClassLoader().getResourceAsStream("msg/"+propfile);
			
			if (in == null)
				in = this.getClass().getClassLoader().getResourceAsStream("msg/"+basename+".properties");
		
			prop.load(in);
			
			value = prop.getProperty(key);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return value;
	}
}
