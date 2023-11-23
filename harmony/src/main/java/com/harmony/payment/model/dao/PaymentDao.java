package com.harmony.payment.model.dao;

import static com.harmony.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.harmony.payment.model.dto.PaymentApplyDate;
import com.harmony.payment.model.dto.PaymentView;

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
	
	public PaymentView selectApplyInfo(Connection conn, int applyNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaymentView result = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectApplyInfo"));
			pstmt.setInt(1, applyNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = getApplyInfo(rs);
				do {
					result.getDates().add(getApplyDate(rs));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	private PaymentApplyDate getApplyDate(ResultSet rs) throws SQLException{
		return PaymentApplyDate.builder()
				.startTime(rs.getTimestamp("START_TIME"))
				.endTime(rs.getTimestamp("END_TIME"))
				.dayOfWeek(rs.getString("DAY_OF_WEEK"))
				.build();
	}

	private PaymentView getApplyInfo(ResultSet rs) throws SQLException{
		return PaymentView.builder()
				.applyNo(rs.getInt("APPLY_NO"))
				.studentMemNo(rs.getString("STUDENT_MEMNO"))
				.lessonTimes(rs.getInt("LESSON_TIMES"))
				.instName(rs.getString("INST_NAME"))
				.applyDate(rs.getDate("APPLY_DATE"))
				.status(rs.getString("APPLY_ACCEPT"))
				.price(rs.getInt("PRICE"))
				.place(rs.getString("PLACE"))
				.teacherMemNo(rs.getString("TEACHER_MEMNO"))
				.teacherName(rs.getString("TEACHER_NAME"))
				.teacherGender(rs.getString("TEACHER_GENDER"))
				.teacherEmail(rs.getString("TEACHER_EMAIL"))
				.teacherIntroduce(rs.getString("TEACHER_INTRODUCE"))
				.paymentStatus(rs.getString("PAYSTATE"))
				.build();
	}
}
