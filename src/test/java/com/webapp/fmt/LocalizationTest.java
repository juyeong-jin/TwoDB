package com.webapp.fmt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Socket;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class LocalizationTest {

	public static void main(String[] args) {
		URL url;
		try{
			url = new URL("http://localhost:8080/TwoDB/localization.jsp");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestProperty("Accept-Language", "ja");
			
			InputStream in = con.getInputStream();
			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
			String line=null;
			while((line = reader.readLine()) != null)
				System.out.println(line);
		
		} catch (MalformedURLException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
		
		
		try {
			Socket sock = new Socket("localhost", 8080);
			InputStream in = sock.getInputStream();
			OutputStream out = sock.getOutputStream();
			
			PrintWriter writer = new PrintWriter(new OutputStreamWriter(out));
			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
			
			writer.println("GET /TwoDB/localization.jsp HTTP/1.1");
			writer.println("Host: localhost:8080");
			writer.println("Accept-Language:zh");
			writer.println();
			writer.println();
			writer.flush();
			
			String line = null;
			while((line = reader.readLine()) != null)
				System.out.println(line);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
