package com.harmony.ensemble.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.harmony.ensemble.model.dto.EnsembleMember;
import com.harmony.ensemble.model.dto.Member;
import com.harmony.ensemble.model.service.EnsembleService;

/**
 * Servlet implementation class AddTeamMemberEndServlet
 */
@WebServlet("/ensemble/addTeamMemEnd.do")
public class AddTeamMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeamMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		->db
		
//		아이디 검색 - 회원인지 확인
//		고유번호 : 합주팀원으로서의 고유번호,,seq ->db
//		팀번호 : 합주팀에서 input type="hidden"으로 팀번호 꽂아주기 
//		악기번호 : 프론트에서 받아오기
//		회원번호 : dto seq
//		가입일 : 프론트에서
//		탈퇴일 : null
//		비회원성별 : null. 합주모집글에서 회원이 아닐 경우 받음.
//		비회원 나이 : null. 합주모집글에서 회원이 아닐 경우 받음.
//		포지션 : CHECK('LEADER','MEMBER')
		
		EnsembleService es = new EnsembleService();
		String ensTeamNo = es.selectSeq();
		
		Member m = es.searchMemberById();
		
		com.harmony.model.dto.Member loginMember = (com.harmony.model.dto.Member)request.getSession().getAttribute("loginMember");
		String loginMemNo = loginMember.getMemNo();
	
		
		EnsembleMember eMem = EnsembleMember.builder()
//								.ensTeamMemberNo()
								.ensTeamNo(ensTeamNo)
								.ensInstCode(request.getParameter("inst"))
								.ensMemNo(m.getMemNo())
								.build();
		
		int result = es.insertEnsMember(eMem, loginMemNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
