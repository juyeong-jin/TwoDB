package com.webapp.blob;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.webapp.util.ConnectionProvider;

public class BlobInsertTest {

	static Log log = LogFactory.getLog(BlobInsertTest.class);
	
	static final String INSERT = " insert into filelist ( " +
								  "	fname,				   " + 
								  "	flength,			   " + 
								  "	flast_modified,		   " + 
								  "	image				   " + 
								  ")					   " +
								  "values (				   " +
								  "	?,					   " + 
								  "	?,					   " + 
								  "	?,					   " + 
								  "	?					   " +
								  ")					   ";
	
	public static void main(String[] args) {
		ConnectionProvider.classLoading();
		try {
			Connection con = ConnectionProvider.getConnectionEmployee();
			PreparedStatement pstmt = con.prepareStatement(INSERT);
			
			File file = new File("C:\\database\\OracleXE112_Win32.zip");
			
			String fname = file.getName();
			int flength = (int)file.length();
			Date flast_modified = new Date();
			flast_modified.setTime(file.lastModified());
			
			InputStream in = new FileInputStream(file);
			
			pstmt.setString(1, fname);
			pstmt.setInt(2, flength);
			pstmt.setTimestamp(3, new Timestamp(flast_modified.getTime()));
			pstmt.setBinaryStream(4, in);
			
			pstmt.executeUpdate();
			
			log.info("insert success...");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
