package com.webapp.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PaginationTest {
	
	static Log log = LogFactory.getLog(Pagination.class);
	
	public static void main(String[] args) { 
		
		final int TOTAL_ITEM = 5;
		
		int totalPage = TOTAL_ITEM / 10;
		if (TOTAL_ITEM % 10 > 0) totalPage++;
		
		
		for (int i=-2; i<=totalPage + 2; i++){
			Pagination paging = new Pagination();
			paging.setPageNo(i);
			paging.setTotalItem(TOTAL_ITEM);
			System.out.println("pageNo = " + i + " " + 
							   "isFirstGroup = " + paging.isFirstGroup() + " " +
							   
							   "firstPage = " + paging.getFirstPage() + " " + 
							   "lastPage = " + paging.getLastPage() + " " + 
							   "firstItem = " + paging.getFirstItem() + " " +
							   "lastItem = " + paging.getLastItem() + " " + 
							   
							   "isLastGroup = " + paging.isLastGroup() + " " +
							   "totalPage = " + paging.getTotalPage() + " " + 
							   "totalItem = " + paging.getTotalItem());
		}
	}

}
