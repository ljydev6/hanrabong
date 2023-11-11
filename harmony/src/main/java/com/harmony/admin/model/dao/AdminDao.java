package com.harmony.admin.model.dao;

import static com.harmony.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.harmony.admin.model.dto.Carousel;

public class AdminDao {
	private static AdminDao dao = new AdminDao();
	private Properties sql = new Properties();
	private AdminDao() {
		String path = AdminDao.class.getResource("/sql/admin/admin.properties").getPath();
		try (FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static AdminDao getDao() {
		return AdminDao.dao;
	}
	
	public List<Carousel> selectActiveCarousels(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Carousel> result = new ArrayList<>();
		
		try{
			pstmt = conn.prepareStatement(sql.getProperty("selectActiveCarousel"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result.add(getCarousel(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	private Carousel getCarousel(ResultSet rs) throws SQLException{
		return Carousel.builder().crslNo(rs.getInt("CRSL_NO"))
								 .crslName(rs.getString("CRSL_NAME"))
								 .crslImgLink(rs.getString("CRSL_IMG_LINK"))
								 .crslPageLink(rs.getString("CRSL_PAGE_LINK"))
								 .crslWriteDate(rs.getDate("CRSL_WRITE_DATE"))
								 .crslEndDate(rs.getDate("CRSL_END_DATE"))
								 .crslIntervalMs(rs.getInt("CRSL_INTERVAL_MS"))
								 .build();
	}
}
