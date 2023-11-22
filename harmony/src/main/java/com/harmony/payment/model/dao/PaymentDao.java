package com.harmony.payment.model.dao;

import static com.harmony.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class PaymentDao {
	
	private static PaymentDao dao = new PaymentDao();

	private PaymentDao() {
		String path = PaymentDao.class.getResource("/sql/payment/payment.properties").getPath();
		try(FileReader fr = new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	};
	Properties sql = new Properties();
	
	public static PaymentDao getDao() {
		return PaymentDao.dao;
	}
	
	public int insertPayment(Connection conn, int applyNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertPayment"));
			pstmt.setInt(1, applyNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
