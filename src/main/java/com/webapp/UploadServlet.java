package com.webapp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.RandomAccessFile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      /*
       * Content-Type = multipart/form-data
       */
      
      String contentType = request.getContentType();
      System.out.println("contentType = " + contentType);
      
      /*
       * Boundary
       */
      
      int idx = contentType.indexOf("boundary=");
      String boundary = contentType.substring(idx + "boundary=".length());
      boundary = "--" + boundary;
      System.out.println("boundary = [" + boundary + "]");
      
      InputStream in = request.getInputStream();
      
      File file = File.createTempFile("upload_", ".upload", new File("C:\\TEMP"));
      FileOutputStream out = new FileOutputStream(file);
      
      byte[] buffer = new byte[10*1024*1024];
      int len = -1;
      int progress = 0;
      while((len=in.read(buffer)) != -1) {
         out.write(buffer, 0, len);
         progress++;
         if (progress%10 == 0) {
            System.out.println();
         }
         System.out.print(".");
         System.out.flush();
      }
      out.close();
      
      RandomAccessFile ranfile = new RandomAccessFile(file, "r");
      
      ranfile.readLine(); // ignore line
      String line = ranfile.readLine();
      byte[] bline = line.getBytes("iso-8859-1");
      line = new String(bline, "utf-8");
      
      /*
       *  filename
       */
      
   		idx = line.indexOf("filename=");
   		String filename = line.substring(idx+"filename=".length());
   		filename = filename.replace("\"", "");
   		System.out.println("filename=[" + filename + "]");
   		
   		idx = filename.lastIndexOf("\\");
   		if (idx > -1)
   			filename = filename.substring(idx + 1);
   		
   		System.out.println("filename=[" + filename + "]");
  
      /*
       * upload file save
       */
      
   		ranfile.readLine();		// ignore
   		ranfile.readLine();		// ignore
   		long start = ranfile.getFilePointer();
   		long end = ranfile.length() - (boundary.length() + 2 + 4);
   		long length = end - start;
   		System.out.println("length = " + length);
   		
   		ranfile.seek(start);
   		
   		int BUF_SIZE = 10*1024*1024;
   		byte[] fbuffer = new byte[BUF_SIZE]; 
   		
   		File uploadFile = File.createTempFile(filename+"_", ".upload", new File("C:\\TEMP\\upload"));
   		FileOutputStream upStream = new FileOutputStream(uploadFile);
   		
   		for (int i=0; i<length/BUF_SIZE; i++) {
   			len = ranfile.read(fbuffer);
   			upStream.write(fbuffer, 0, len);
   		}
   		
   		long mod = 0;
   		if ((mod = length%BUF_SIZE) > 0) {
   			len = ranfile.read(fbuffer, 0, (int)mod);
   			upStream.write(fbuffer, 0, len);
   		}
   		upStream.close();
   		
      // 랜덤엑세스 
      // 입력과 출력이 동시에 이뤄질수가있다. 
      // 파일의 중간이나 끝부분에 저장된 데이터를 먼저읽어야하는 경우 
      // 입출력 위치를 임의로 변경할수 있다. 
      // 파일을 대상으로 한다. 
//      RandomAccessFile raf = new RandomAccessFile("upload", "rw"); 
//      // 4바이트 정수 24를 쓰기 
//      raf.writeChars(contentType);
//      // 현재위치를 출력 
//      System.out.printf("현재 입출력의 위치 %d 바이트\n", raf.getFilePointer());
//      // 파일의 위치를 처음으로 돌린다 
//      raf.seek(0); 
//      // 쓴기록을 읽는다. 
//      // 이와 같이 위에서 쓰고 아래서 바로 읽기가 가능하다 그것은 랜덤엑세스모드를 읽기쓰기인 rw로 햇기떄문이다. 
//      System.out.println("랜덤엑세스로 파일내용 : "+raf.readLine()); 
//      // 파일을 닫는다 
//      raf.close();
      
      
      
      PrintWriter writer = response.getWriter();
      writer.println("<h1> Upload Success </h1>");
      
   }
}