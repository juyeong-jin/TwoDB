package com.webapp.blob;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.webapp.util.ConnectionProvider;

public class BlobSelectTest {

	static Log log = LogFactory.getLog(BlobSelectTest.class);
	
	static final String SELECT =  " select fname,		  		 " + 
								  "		   flength,			  	 " + 
								  "		   flast_modified,		 " + 
								  "		   image				 " + 
								  "	from filelist				 " +
								  "	where fname = ?		   		 ";
	
	public static void main(String[] args) {
		ConnectionProvider.classLoading();
		try {
			Connection con = ConnectionProvider.getConnectionEmployee();
			PreparedStatement pstmt = con.prepareStatement(SELECT);
			
			File file = new File("xxx\\" + "pom.xml");
//			File file = new File("C:\\database\\OracleXE112_Win32.zip");
			
			pstmt.setString(1, file.getName());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String fname = rs.getString("fname");
				int flength = rs.getInt("flength");
				Date flast_modified = rs.getTimestamp("flast_modified");
				
				InputStream in = rs.getBinaryStream("image");
				FileOutputStream out = new FileOutputStream(file);
				
				byte[] buffer = new byte[10*1024*1024]; // 10M
				int len = -1;
				while((len = in.read(buffer)) != -1) {
					out.write(buffer, 0, len);
				}
				
				in.close();
				out.close();
				
				file.setLastModified(flast_modified.getTime());
				
				log.info("fname = " + fname);
				log.info("flength = " + flength);
				log.info("flast_modified = " + flast_modified);
				
			}
			
			
			log.info("insert success...");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
