package com.harmony.payment.service;

public class PaymentService {
	private static PaymentService service = new PaymentService();
	private PaymentService() {};
	
	public static PaymentService getService() {
		return PaymentService.service;
	}
	
	
}
