package com.harmony.member.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.harmony.model.dao.MemberDao;
import com.harmony.model.dto.Member;
import com.harmony.model.dto.MemberInfo;

public class MemberService {
	private MemberDao dao= new MemberDao();
	
	public Member selectMemberByKakaoId(String kakaoNum){
	Connection conn = getConnection();
	Member result = dao.selectMemberByKakaoId(conn,kakaoNum);
	close(conn);
	return result;
	}
	
	public Member insertMember(Member m,MemberInfo mi) {
		Connection conn = getConnection();
		String memNo = dao.selectMemNoFromDual(conn);
		Member result = null;
		m.setMemNo(memNo);
		int resultMember =dao.insertMember(conn,m);
		if(resultMember>0) {
			mi.setMemNo(memNo);
			int resultInfo = dao.insertMemberInfo(conn, mi);
			if(resultInfo>0) {
				commit(conn);
				result = dao.selectMemberByKakaoId(conn,m.getMemKakaoNum());
			}else rollback(conn);
		} else rollback(conn);
		close(conn);
		return result;
	}
}
