package com.webapp;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.Socket;
import java.net.URL;
import java.net.UnknownHostException;

public class DownloadServletTest {

	public static void main(String[] args) throws UnknownHostException, IOException {
		
		String filename="OracleXE112_Win32.zip";
		
		URL url = new URL("http://localhost:8080/TwoDB/download?filename=" + filename);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		
		String contentType = con.getContentType();
		String contentDisposition = con.getHeaderField("Content-Disposition");
		int contentLength = con.getContentLength();
		System.out.println("contentType = " + contentType);
		
		// 한글이름 파일처리
		byte[] bytecontentDisposition = contentDisposition.getBytes("iso-8859-1");
		String newcontentDisposition = new String(bytecontentDisposition, "euc-kr");
		
		System.out.println("contentDisposition = " + newcontentDisposition);
		System.out.println("contentLength = " + contentLength);
		
		InputStream in = con.getInputStream();
		FileOutputStream out = new FileOutputStream(filename);
		
		byte[] buffer = new byte[10*1024*1024]; // 1M
		int len=-1;
		
		int linebreak=0;
		while((len = in.read(buffer)) != -1) {
			out.write(buffer, 0, len);
			linebreak++;
			if (linebreak % 50 == 0)
				System.out.println();
			System.out.print(".");
		}
		
		out.close();
		in.close();
		
	}
	
	public static void download1() throws UnknownHostException, IOException {
		
		Socket soc = new Socket("localhost", 8080);
		
		PrintWriter writer = new PrintWriter(new OutputStreamWriter(soc.getOutputStream()));
		BufferedReader reader = new BufferedReader(new InputStreamReader(soc.getInputStream()));
		
		String filename="xxx.zip";
		writer.println("GET /TwoDB/download?filename="+filename + " HTTP/1.1");
		writer.println("Host: localhost:8080");
		writer.println();
		writer.println();
		writer.flush();
		
		String line="";
		while ((line=reader.readLine()) != null) {
			System.out.println(line);
		}
	}
}
