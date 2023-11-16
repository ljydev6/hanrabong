package com.harmony.admin.service;

import static com.harmony.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.harmony.admin.model.dao.AdminDao;
import com.harmony.admin.model.dto.AdminMember;
import com.harmony.admin.model.dto.Carousel;
import com.harmony.admin.model.dto.NoticeList;

public class AdminService {
	private static AdminService service = new AdminService();
	private AdminService() {};
	
	public static AdminService getService() {
		return AdminService.service;
	}
	
	public List<Carousel> selectActiveCarousels(){
		Connection conn = getConnection();
		List<Carousel> result = AdminDao.getDao().selectActiveCarousels(conn);
		close(conn);
		return result;
	}
	
	public List<Carousel> selectAllCarousels(){
		Connection conn = getConnection();
		List<Carousel> result = AdminDao.getDao().selectAllCarousels(conn);
		close(conn);
		return result;
	}
	
	public AdminMember adminLogin(AdminMember login) {
		Connection conn = getConnection();
		AdminMember result = AdminDao.getDao().adminLogin(conn, login);
		close(conn);
		return result;
	}

	public int deleteCarousel(String crslNo) {
		Connection conn = getConnection();
		int result = AdminDao.getDao().deleteCarousel(conn,crslNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public Carousel insertCarousel(Carousel c) {
		Connection conn = getConnection();
		int seqCrslNo = AdminDao.getDao().getCrslSeqNo(conn);
		c.setCrslNo(seqCrslNo);
		int result = AdminDao.getDao().insertCarousel(conn,c);
		Carousel cResult = null;
		if(result>0) {
			commit(conn);
			cResult = AdminDao.getDao().getCrslByCrslNo(conn,seqCrslNo);
		}else {
			rollback(conn);
		}
		return cResult;
	}

	public Carousel updateCarousel(Carousel c) {
		Connection conn = getConnection();
		int result = AdminDao.getDao().updateCarousel(conn,c);
		Carousel cResult = null;
		if(result>0) {
			commit(conn);
			cResult = AdminDao.getDao().getCrslByCrslNo(conn,c.getCrslNo());
		}else {
			rollback(conn);
		}
		return cResult;
	}

	public List<NoticeList> selectNoticeList(String type, String keyword) {
		Connection conn = getConnection();
		List<NoticeList> result = AdminDao.getDao().selectNoticeList(conn, type, keyword);
		close(conn);
		return result;
	}

	public int getNoticeTotalData(String type, String keyword) {
		Connection conn = getConnection();
		int result = AdminDao.getDao().getNoticeTotalData(conn,type,keyword);
		close(conn);
		return result;
	}
	
	
	
}
