package com.webapp.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.webapp.model.City;
import com.webapp.util.ConnectionProvider;

public class CityDaoTest {

	static Log log = LogFactory.getLog(CityDao.class);
	
	public static void main(String[] args) {
		ConnectionProvider.classLoading();
		Connection con = null;
		try {
			con = ConnectionProvider.getConnectionWorld();
			CityDao dao = new CityDao(con);
			int totalItem = dao.getTotalCount();
			log.info("totalItem = " + totalItem);
			List<City> citys = dao.selectAll(11, 20);
			
			for (City city : citys)
				log.info(city.getName());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
