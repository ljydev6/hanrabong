package com.harmony.message.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.message.model.dao.MessageDao;
import com.harmony.message.model.dto.Message;

public class MessageService {
	private static MessageService service = new MessageService();
	private MessageService() {};
	public static MessageService getService() {
		return MessageService.service;
	}
	
	public int sendMessage(Message msg) {
		Connection conn = getConnection();
		int result = MessageDao.getDao().sendMessage(conn, msg);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int getUnreadMessage(String memNo) {
		Connection conn = getConnection();
		int result = MessageDao.getDao().getUnreadMessage(conn,memNo);
		close(conn);
		return result;
	}
	public List<Message> selectMessageByMemno(String memno) {
		Connection conn = getConnection();
		List<Message> result = MessageDao.getDao().selectMessageByMemno(conn,memno);
		close(conn);
		return result;
	}
	
	public int readMessage(String msgNo) {
		Connection conn = getConnection();
		int result = MessageDao.getDao().readMessage(conn, msgNo);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
}
