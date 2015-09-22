package com.webapp.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.webapp.dao.CityDao;
import com.webapp.model.City;
import com.webapp.model.CityList;
import com.webapp.util.ConnectionProvider;

public class CityListServiceTest {

	static Log log = LogFactory.getLog(CityListServiceTest.class);

	
	public static void main(String[] args) {
		ConnectionProvider.classLoading();
		
		CityListService service = new CityListService();
		
		CityList model = service.getList(1);
		log.info("totalItem = " + model.getTotalItem());
		log.info("totaPage = " + model.getTotalPage());
		log.info("firstItem = " + model.getFirstItem());
		log.info("lastItem = " + model.getLastItem());
		for (City c : model.getCitys()) {
			log.info(c.getId() + " " + c.getName());
		}

	}

}
