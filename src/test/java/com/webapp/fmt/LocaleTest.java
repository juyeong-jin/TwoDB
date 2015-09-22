package com.webapp.fmt;

import java.util.Locale;

public class LocaleTest {

	public static void main(String[] args) {
		Locale[] locales = Locale.getAvailableLocales();
		
		for (Locale l : locales) {
			System.out.println(l.getLanguage() + "_" + l.getCountry() + "\t" +
							   l.getDisplayLanguage() + "_" + l.getDisplayCountry()
							   );
		}
		System.out.println("############################");
		Locale d = Locale.getDefault();
		System.out.println(d.getLanguage() + "_" + d.getCountry() + "\t" +
						   d.getDisplayLanguage() + "_" + d.getDisplayCountry()
							   );
	    Locale.setDefault(Locale.CHINESE);
	    System.out.println("#############################");
	    d = Locale.getDefault();
	    System.out.println(d.getLanguage() + "_" + d.getCountry() + "\t" +
	    				  d.getDisplayLanguage() + " " + d.getDisplayCountry()
	            		  );

	   
	}

}