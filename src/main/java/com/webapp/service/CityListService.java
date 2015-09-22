package com.webapp.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.webapp.dao.CityDao;
import com.webapp.model.CityList;
import com.webapp.util.ConnectionProvider;

public class CityListService {

	public CityList getList(int pageNo) { 
		CityList model = new CityList();
		model.setPageNo(pageNo);
		
		Connection con = null;
		try {
			con = ConnectionProvider.getConnectionWorld();
			CityDao dao = new CityDao(con);
			model.setTotalItem(dao.getTotalCount());
			model.setCitys(dao.selectAll(model.getFirstItem(), model.getLastItem()));
			
 		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return model;
	}
}
