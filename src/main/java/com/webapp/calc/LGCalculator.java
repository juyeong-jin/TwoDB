package com.webapp.calc;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class LGCalculator implements Calculator{

	static Log log = LogFactory.getLog(LGCalculator.class);
	
	void calc() {
		log.info("LG 계산 시작");
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("LG 계산 종료");
	}
	
	@Override
	public int addTwo(int a, int b) {
		calc();
		return a+b;
	}

	@Override
	public int subTwo(int a, int b) {
		calc();
		return a-b;
	}

	@Override
	public int divTow(int a, int b) {
		calc();
		return a/b;
	}

	@Override
	public int mulTwo(int a, int b) {
		calc();
		return a*b;
	}

}
