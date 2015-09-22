package com.webapp.calc;

public class CalculatorTest {
	
	public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		
		Class<?> cls = Class.forName("com.webapp.calc.LGCalculator");
		Calculator calc = (Calculator) cls.newInstance();
		
		int add = calc.addTwo(10, 5);
		int sub = calc.subTwo(10, 5);
		int div = calc.divTow(10, 5);
		int mul = calc.mulTwo(10, 5);
	}

}
