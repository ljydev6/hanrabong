package com.harmony.payment.service;

import static com.harmony.common.JDBCTemplate.*;

import java.sql.Connection;

import com.harmony.payment.model.dao.PaymentDao;
import com.harmony.payment.model.dto.PaymentView;

public class PaymentService {
	private static PaymentService service = new PaymentService();
	private PaymentService() {};
	
	public static PaymentService getService() {
		return PaymentService.service;
	}
	
	public PaymentView selectPaymentView(int applyNo) {
		Connection conn = getConnection();
		PaymentView result = PaymentDao.getDao().selectApplyInfo(conn, applyNo);
		close(conn);
		return result;
	}
	
}
