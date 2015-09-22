package com.webapp.exception;

public class InsertRuntimeException extends RuntimeException{

	public InsertRuntimeException(String msg) {
		super(msg);
	}
	
	public InsertRuntimeException(Throwable e) {
		super(e);
	}
	
	public InsertRuntimeException(String msg, Throwable e) {
		super(msg, e);
	}
}
