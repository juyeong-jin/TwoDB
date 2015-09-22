package com.webapp;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mysql.jdbc.Buffer;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static Log log = LogFactory.getLog(DownloadServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    static final String UPLOAD_DIR="C:\\TEMP\\upload\\";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String filename = request.getParameter("filename");
		if (filename == null || filename.equals("")) {
			response.setStatus(404);
			PrintWriter writer = response.getWriter();
			writer.println("<h3>filename parameter missing...</h3>");
			return;
		}
		
		File dfile = new File(UPLOAD_DIR + filename);
		
		if (!dfile.exists()) {
			PrintWriter writer = response.getWriter();
			writer.println("<h3>filename not found</h3>");
			return;
		}
		
		// 한글 처리
		byte[] filebyte = filename.getBytes("euc-kr");
		String newfilename = new String(filebyte, "iso-8859-1");
		
		// 1. Content-Type 설정
		response.setContentType("application/octet-stream");
		// 2. Content-Disposition 설정
		String options = "attachment; filename=\"" + newfilename + "\"";
		response.setHeader("Content-Disposition", options);
		// 3. Body transfer
		OutputStream out = response.getOutputStream();
		FileInputStream in = new FileInputStream(dfile);
		
		byte[] buffer = new byte[1024*1024];
		
		int len=-1;
		while((len = in.read(buffer)) != -1) {
			out.write(buffer , 0 , len);
		}
		in.close();
		out.close();
	}

	
}
