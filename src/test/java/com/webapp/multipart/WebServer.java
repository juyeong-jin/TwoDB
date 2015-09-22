package com.webapp.multipart;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.sql.Savepoint;

public class WebServer {

   public static void main(String[] args) {
      ServerSocket server = null;
      try {
         server = new ServerSocket(8081);
         System.out.println("WebServer start...");
         Socket client = server.accept();
         
         client.setSoTimeout(3000);
         
         InputStream in = client.getInputStream();
         saveRequest(in);
         
         OutputStream out = client.getOutputStream();
         PrintWriter writer = new PrintWriter(new OutputStreamWriter(out));
         writer.println("HTTP/1.1 200 OK");
         writer.println("Content-Type: text/html;");
         writer.println();
         writer.println("<h1>Success...");
         writer.flush();
         writer.close();
         
         client.close();
         
         System.out.println("WebServer end...");
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         try {
            server.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      
   }

   static void saveRequest(InputStream in) throws IOException {
      FileOutputStream out = null;
      try {
         File temp = File.createTempFile("upload_", ".upload", new File("C:\\TEMP"));
         out = new FileOutputStream(temp);
      byte[] buffer = new byte[10*1024*1024];
      int len = -1;
      while((len = in.read(buffer)) != -1) {
         out.write(buffer, 0, len);
         System.out.println(".");
         }
      } catch (SocketTimeoutException e) {
         System.out.println("Time out...");
      } finally {
         out.close();
      }
   }

}