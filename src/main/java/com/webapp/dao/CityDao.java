package com.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.webapp.model.City;
import com.webapp.model.Country;

public class CityDao {
	Connection con;
	public CityDao(Connection con) {
		this.con = con;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int getTotalCount() {
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select count(*) from city");
			rs.next();
			count = rs.getInt(1);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
	
	City mapping(ResultSet rs) throws SQLException {
		City city = new City();
		city.setId(rs.getInt("id"));
		city.setName(rs.getString("name"));
		
		Country country = new Country();		
		country.setCode(rs.getString("countrycode"));
		city.setCountry(country);
		
		city.setDistrict(rs.getString("district"));
		city.setPopulation(rs.getInt("population"));
		return city;
	}
	
	public List<City> selectAll(int firstItem, int lastItem) {
		List<City> citys = new ArrayList<City>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int start = firstItem - 1;
		int count = lastItem - firstItem + 1;
		try {
			pstmt = con.prepareStatement("select * from city limit ?, ?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, count);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				City city = mapping(rs);
				citys.add(city);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return citys;
	}
}

