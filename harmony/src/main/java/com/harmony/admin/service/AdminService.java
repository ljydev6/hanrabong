package com.harmony.admin.service;

import static com.harmony.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.harmony.admin.model.dao.AdminDao;
import com.harmony.admin.model.dto.Carousel;

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
}
