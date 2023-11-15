package com.harmony.member.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.model.dao.MemberDao;
import com.harmony.model.dto.Member;
import com.harmony.model.dto.MemberInfo;
import com.harmony.model.dto.MemberMusic;
import com.harmony.model.dto.MemberVideo;

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
	public int addintroduce(MemberInfo mi) { 
		Connection conn = getConnection();
		MemberInfo result= null;
		int resultAdd = dao.addintroduce(conn,mi);
		if(resultAdd>0) {
			if(!mi.getMemberMusic().isEmpty()) {
				for(MemberMusic mm:mi.getMemberMusic()) {
					mm.setMemNo(mi.getMemNo());
					int resultmusic=dao.insertMusic(conn,mm);
					if(resultmusic==0) {
						rollback(conn);
						throw new IllegalArgumentException("입력실패");
					}
				}
			}
			if(!mi.getMemberVideo().isEmpty()) {
				for(MemberVideo mv:mi.getMemberVideo()) {
					mv.setMemNo(mi.getMemNo());
					int resultVideo=dao.insertVideo(conn,mv);
					if(resultVideo==0) {
						rollback(conn);
						throw new IllegalArgumentException("입력실패");
					}
				}
			}
			commit(conn);
		}else {
			rollback(conn);
			throw new IllegalArgumentException("입력실패");
		}
		close(conn);
		
		
		return resultAdd;
	}
}
