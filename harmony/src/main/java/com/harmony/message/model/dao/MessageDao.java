package com.harmony.message.model.dao;

import static com.harmony.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.harmony.message.model.dto.Message;

public class MessageDao {
	private static MessageDao dao = new MessageDao();
	private MessageDao() {
		String path = MessageDao.class.getResource("/sql/message/message.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(Exception e) {
			e.printStackTrace();
		}
	};
	private Properties sql = new Properties();
	
	public static MessageDao getDao() {
		return MessageDao.dao;
	}
	
	public int sendMessage(Connection conn, Message msg) {
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("sendMessage"));
			// INSERT INTO TBL_MESSAGE VALUES(SEQ_MSG_NO.NEXTVAL,?,?,?,DEFAULT,NULL,?)
			pstmt.setString(1,msg.getReceiveMem());
			pstmt.setString(2,msg.getSendMem());
			pstmt.setString(3,msg.getContent());
			pstmt.setString(4,msg.getCatCode().name());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int getUnreadMessage(Connection conn, String memNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("getUnreadMessage"));
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
