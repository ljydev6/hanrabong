package com.harmony.admin.model.dao;

import static com.harmony.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import com.harmony.admin.model.dto.AdminMember;
import com.harmony.admin.model.dto.Carousel;
import com.harmony.admin.model.dto.Notice;
import com.harmony.admin.model.dto.NoticeAttachFile;
import com.harmony.admin.model.dto.NoticeList;

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
								 .crslViewRank(rs.getInt("CRSL_VIEW_RANK"))
								 .status(rs.getString("STATUS"))
								 .build();
	}

	public AdminMember adminLogin(Connection conn, AdminMember login) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminMember member = null;
		
		try{
			pstmt = conn.prepareStatement(sql.getProperty("adminLogin"));
			pstmt.setString(1, login.getAdminId());
			pstmt.setString(2, login.getAdminPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = AdminMember.builder().adminId(rs.getString("ADMIN_ID"))
											  .adminName(rs.getString("ADMIN_NAME"))
											  .adminNo(rs.getString("ADMIN_NO"))
											  .build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}

	public List<Carousel> selectAllCarousels(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Carousel> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectAllCarousel"));
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

	public int deleteCarousel(Connection conn, String crslNo) {
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteCarousel"));
			pstmt.setString(1, crslNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getCrslSeqNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("getCrslSeqNo"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertCarousel(Connection conn, Carousel c) {
		PreparedStatement pstmt = null;
		int result = -1;
		String query = sql.getProperty("insertCarousel");
		StringBuilder cols = new StringBuilder();
		StringBuilder vals = new StringBuilder();
		
		cols.append("CRSL_NO,");
		vals.append("? ,");
		if(c.getCrslName()!=null) {
			cols.append("CRSL_NAME,");
			vals.append("? ,");
		}
		if(c.getCrslImgLink()!=null) {
			cols.append("CRSL_IMG_LINK,");
			vals.append("? ,");
		}
		if(c.getCrslPageLink()!=null) {
			cols.append("CRSL_PAGE_LINK,");
			vals.append("? ,");
		}
		if(c.getCrslWriteDate()!=null) {
			cols.append("CRSL_WRITE_DATE,");
			vals.append("? ,");
		}
		if(c.getCrslEndDate()!=null) {
			cols.append("CRSL_END_DATE,");
			vals.append("? ,");
		}
		if(c.getCrslIntervalMs()>=0) {
			cols.append("CRSL_INTERVAL_MS,");
			vals.append("? ,");
		}
		if(c.getCrslViewRank()>=0) {
			cols.append("CRSL_VIEW_RANK,");
			vals.append("? ,");
		}
		query = query.replace("#cols", cols.substring(0, cols.length()-1).toString());
		query = query.replace("#vals", vals.substring(0, vals.length()-1).toString());
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;
			pstmt.setInt(count++, c.getCrslNo());
			if(c.getCrslName()!=null) {
				pstmt.setString(count++, c.getCrslName());
			}
			if(c.getCrslImgLink()!=null) {
				pstmt.setString(count++, c.getCrslImgLink());
			}
			if(c.getCrslPageLink()!=null) {
				pstmt.setString(count++, c.getCrslPageLink());
			}
			if(c.getCrslWriteDate()!=null) {
				pstmt.setDate(count++, c.getCrslWriteDate());
			}
			if(c.getCrslEndDate()!=null) {
				pstmt.setDate(count++, c.getCrslEndDate());
			}
			if(c.getCrslIntervalMs()>=0) {
				pstmt.setInt(count++, c.getCrslIntervalMs());
			}
			if(c.getCrslViewRank()>=0) {
				pstmt.setInt(count++, c.getCrslViewRank());
			}
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Carousel getCrslByCrslNo(Connection conn, int seqCrslNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Carousel result = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectCarouselByCrslNo"));
			pstmt.setInt(1, seqCrslNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = getCarousel(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int updateCarousel(Connection conn, Carousel c) {
		PreparedStatement pstmt = null;
		int result = -1;
		String query = sql.getProperty("updateCarousel");
		StringBuilder cols = new StringBuilder();
		
		if(c.getCrslName()!=null) {
			cols.append("CRSL_NAME = ?,");
		}
		if(c.getCrslImgLink()!=null) {
			cols.append("CRSL_IMG_LINK = ?,");
		}
		if(c.getCrslPageLink()!=null) {
			cols.append("CRSL_PAGE_LINK = ?,");
		}
		if(c.getCrslWriteDate()!=null) {
			cols.append("CRSL_WRITE_DATE = ?,");
		}
		if(c.getCrslEndDate()!=null) {
			cols.append("CRSL_END_DATE = ?,");
		}
		if(c.getCrslIntervalMs()>=0) {
			cols.append("CRSL_INTERVAL_MS = ?,");
		}
		if(c.getCrslViewRank()>=0) {
			cols.append("CRSL_VIEW_RANK = ?,");
		}
		
		query = query.replace("#cols", cols.substring(0, cols.length()-1).toString());
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;
			if(c.getCrslName()!=null) {
				pstmt.setString(count++, c.getCrslName());
			}
			if(c.getCrslImgLink()!=null) {
				pstmt.setString(count++, c.getCrslImgLink());
			}
			if(c.getCrslPageLink()!=null) {
				pstmt.setString(count++, c.getCrslPageLink());
			}
			if(c.getCrslWriteDate()!=null) {
				pstmt.setDate(count++, c.getCrslWriteDate());
			}
			if(c.getCrslEndDate()!=null) {
				pstmt.setDate(count++, c.getCrslEndDate());
			}
			if(c.getCrslIntervalMs()>=0) {
				pstmt.setInt(count++, c.getCrslIntervalMs());
			}
			if(c.getCrslViewRank()>=0) {
				pstmt.setInt(count++, c.getCrslViewRank());
			}
			pstmt.setInt(count++, c.getCrslNo());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<NoticeList> selectNoticeList(Connection conn, String type, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeList> result = new ArrayList<>();
		String query = sql.getProperty("selectNoticeList");
		if(type!=null&&keyword!=null) {
			query = query.replace("#where","WHERE "+type+"=?");
		}else {
			query = query.replace("#where", "");
		}
		try{
			pstmt = conn.prepareStatement(query);
			if(type!=null&&keyword!=null) {
				pstmt.setString(1, keyword);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result.add(getNoticeList(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int getNoticeTotalData(Connection conn, String type, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		String query = sql.getProperty("getNoticeTotalData");
		if(type!=null&&keyword!=null) {
			query = query.replace("#where", "WHERE "+type+"= ?");
		}else {
			query = query.replace("#where", "");
		}
		try {
			pstmt = conn.prepareStatement(query);
			if(type!=null&&keyword!=null) {
				pstmt.setString(1, keyword);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public NoticeList getNoticeList(ResultSet rs) throws SQLException{
		return NoticeList.builder().noticeNo(rs.getInt("NOTICE_NO"))
								   .writer(rs.getString("WRITER"))
								   .title(rs.getString("TITLE"))
								   .writeDate(rs.getDate("WRITE_DATE"))
								   .viewCount(rs.getInt("VIEW_COUNT"))
								   .hasFile(rs.getInt("DATACOUNT")>0)
								   .build();
	}

	public Notice getNoticeByNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice result = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectNoticeByNo"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = getNotice(rs);
				do {
					NoticeAttachFile file = getNoticeFile(rs);
					if(file !=null) {
						result.getAttachFileList().add(file);
					}
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

	private NoticeAttachFile getNoticeFile(ResultSet rs) throws SQLException{
		NoticeAttachFile result = null;
		if(rs.getInt("FILE_NO")>0) {
			result = NoticeAttachFile.builder().noticeFileNo(rs.getInt("FILE_NO"))
												.noticeNo(rs.getInt("NO"))
												.oriName(rs.getString("ORINAME"))
												.reName(rs.getString("RENAME"))
												.build();
		}
		return result;
	}

	private Notice getNotice(ResultSet rs) throws SQLException{
		return Notice.builder().noticeNo(rs.getInt("NO"))
							   .title(rs.getString("TITLE"))
							   .noticeWriter(rs.getString("WRITER"))
							   .content(rs.getString("CONTENT"))
							   .writeDate(rs.getDate("WRITE_DATE"))
							   .viewCount(rs.getInt("VIEW_COUNT"))
							   .build();
	}

	public int addNoticeViewCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("addNoticeViewCount"));
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertNotice"));
			pstmt.setInt(1, notice.getNoticeNo());
			pstmt.setString(2, notice.getNoticeWriter());
			pstmt.setString(3, notice.getTitle());
			pstmt.setCharacterStream(4, new StringReader(notice.getContent()), notice.getContent().length());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertNoticeFile(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int[] resultArray = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertNoticeFile"));
			for(NoticeAttachFile f :notice.getAttachFileList()) {
				pstmt.setInt(1, notice.getNoticeNo());
				pstmt.setString(2, f.getOriName());
				pstmt.setString(3, f.getReName());
				pstmt.addBatch();
				pstmt.clearParameters();
			}
			resultArray = pstmt.executeBatch();
			System.out.println(Arrays.toString(resultArray));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		if(resultArray!=null&& resultArray.length>0) {
			int temp = 1;
			for(int i:resultArray) {
				System.out.println(i);
				if(i==-2) {
					temp *= 1;
				}else if(i==-3) {
					temp *= 0;
				}else {
					temp *=i;
				}
			}
			System.out.println(temp);
			result = result + temp;
		}
		System.out.println(result);
		return result;
	}
	
	public int getNoticeSequence(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("getNoticeSequence"));
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

	public int updateNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("updateNotice"));
			pstmt.setString(1, notice.getTitle());
			pstmt.setCharacterStream(2, new StringReader(notice.getContent()), notice.getContent().length());
			pstmt.setInt(3, notice.getNoticeNo());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNoticeFileByBrdNo(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteNoticeFileByBrdNo"));
			pstmt.setInt(1, notice.getNoticeNo());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNoticeFileByFileNo(Connection conn, String[] delFile) {
		PreparedStatement pstmt = null;
		int[] results = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteNoticeFileByFileNo"));
			for(String f : delFile) {
				pstmt.setString(1, f);
				pstmt.addBatch();
			}
			results = pstmt.executeBatch();
			System.out.println(Arrays.toString(results));
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		if(results != null && results.length>0) {
			int temp = 1;
			for(int i:results) {
				System.out.println(i);
				if(i==-2) {
					temp *= 1;
				}else if(i==-3) {
					temp *= 0;
				}else {
					temp *=i;
				}
			}
			System.out.println(temp);
			result = result + temp;
		}
		System.out.println(result);
		return result;
	}
}
