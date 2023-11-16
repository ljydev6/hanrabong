package com.harmony.ensemble.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.ensemble.model.dto.MemberEns;
import com.harmony.ensemble.model.service.EnsembleService;
/**
 * Servlet implementation class SearchEmail
 */
@WebServlet("/ensemble/searchEmail.do")
public class SearchEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//확인결과를 저장
		// null이면 사용이 가능, null이 아니면 사용이 불가능
//		request.setAttribute("result", m==null);
		//아이디 중복확인 결과를 출력해주는 화면출력
		
		//이메일 검색 
		//사용자가 전달한 이메일이 DB(TBL_MEMBER_INFO)에 있는지 확인
		
		EnsembleService es = new EnsembleService();
//		
		String userEmail = request.getParameter("searchKeyword");
		String memNo= es.selectMemberByEmail(userEmail); //검색한 이메일의 회원넘버
////		String instCode = request.getParameter("inst");
//		
//		MemberEns loginMember = (MemberEns)request.getSession().getAttribute("loginMember");
//		int result = 0;
//		
//			String loginMemNo = loginMember.getMemNo();
//	
//			//로그인한 멤버가 회원테이블에 있는지 - LEADER
//			
//		
//			String loginEmail = loginMember.getMemInfoEmail();
			
			if(memNo!=null) {
				//검색한 이메일이 회원 테이블에 있으면
				request.getRequestDispatcher("/views/ensemble/searchEmail.jsp").forward(request, response);
			
			}else{
				//검색한 이메일이 회원 테이블에 없음
				request.setAttribute("msg","존재하지 않는 회원입니다.");
				
					
			}
				
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
