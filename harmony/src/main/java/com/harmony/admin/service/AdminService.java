package com.harmony.admin.service;

import static com.harmony.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.harmony.admin.model.dao.AdminDao;
import com.harmony.admin.model.dto.AdminMember;
import com.harmony.admin.model.dto.Carousel;
import com.harmony.admin.model.dto.Notice;
import com.harmony.admin.model.dto.NoticeList;

public class AdminService {
	private static AdminService service = new AdminService();

	private AdminService() {
	};

	public static AdminService getService() {
		return AdminService.service;
	}

	public List<Carousel> selectActiveCarousels() {
		Connection conn = getConnection();
		List<Carousel> result = AdminDao.getDao().selectActiveCarousels(conn);
		close(conn);
		return result;
	}

	public List<Carousel> selectAllCarousels() {
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
		int result = AdminDao.getDao().deleteCarousel(conn, crslNo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public Carousel insertCarousel(Carousel c) {
		Connection conn = getConnection();
		int seqCrslNo = AdminDao.getDao().getCrslSeqNo(conn);
		c.setCrslNo(seqCrslNo);
		int result = AdminDao.getDao().insertCarousel(conn, c);
		Carousel cResult = null;
		if (result > 0) {
			commit(conn);
			cResult = AdminDao.getDao().getCrslByCrslNo(conn, seqCrslNo);
		} else {
			rollback(conn);
		}
		return cResult;
	}

	public Carousel updateCarousel(Carousel c) {
		Connection conn = getConnection();
		int result = AdminDao.getDao().updateCarousel(conn, c);
		Carousel cResult = null;
		if (result > 0) {
			commit(conn);
			cResult = AdminDao.getDao().getCrslByCrslNo(conn, c.getCrslNo());
		} else {
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
		int result = AdminDao.getDao().getNoticeTotalData(conn, type, keyword);
		close(conn);
		return result;
	}

	public Notice selectNoticeByNo(int no, boolean viewCount) {
		Connection conn = getConnection();
		Notice result = AdminDao.getDao().getNoticeByNo(conn, no);
		if (result != null) {
			int vcresult = AdminDao.getDao().addNoticeViewCount(conn, no);
			if (vcresult > 0) {
				commit(conn);
				if (viewCount) {
					result.setViewCount(result.getViewCount() + 1);
				}
			} else {
				rollback(conn);
			}
		}
		close(conn);
		return result;
	}

	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int seq = AdminDao.getDao().getNoticeSequence(conn);
		notice.setNoticeNo(seq);
		int result = AdminDao.getDao().insertNotice(conn, notice);
		if (result > 0 && notice.getAttachFileList().size() > 0) {
			result = AdminDao.getDao().insertNoticeFile(conn, notice);
			if (result > 0) {
				commit(conn);
				result = seq;
			} else {
				rollback(conn);
			}
		} else if (result > 0 && notice.getAttachFileList().size() == 0) {
			commit(conn);
			result = seq;
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateNotice(Notice notice, String[] delFile) {
		Connection conn = getConnection();
		int result = AdminDao.getDao().updateNotice(conn, notice);
		if (result > 0) {
			boolean insertFlag = false;
			boolean deleteFlag = false;
			int insertResult = 1;
			int deleteResult = 1;
			if (notice.getAttachFileList().size() > 0) {
				insertFlag = true;
				insertResult = AdminDao.getDao().insertNoticeFile(conn, notice);
			}
			if (delFile != null && delFile.length > 0) {
				deleteFlag = true;
				deleteResult = AdminDao.getDao().deleteNoticeFileByFileNo(conn, delFile);
			}
			System.out.println("editresult:"+result);
			System.out.println("insertFlag:"+insertFlag);
			System.out.println("deleteFlag:"+deleteFlag);
			System.out.println("insertResult:"+insertResult);
			System.out.println("deleteResult:"+deleteResult);
			if (insertFlag && deleteFlag) {
				result = insertResult * deleteResult;
			} else if (insertFlag || deleteFlag) {
				result = insertFlag ? insertResult : deleteResult;
			}
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		return result;
	}

}
