package com.harmony.ensemble.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
//		고유번호 : 합주팀원으로서의 고유번호,,seq ->db
//		팀번호 : 합주팀에서 input type="hidden"으로 팀번호 꽂아주기 
//		악기번호 : 프론트에서 받아오기
//		회원번호 : dto seq
//		가입일 : 프론트에서
//		탈퇴일 : null
//		비회원성별 : null. 합주모집글에서 회원이 아닐 경우 받음.
//		비회원 나이 : null. 합주모집글에서 회원이 아닐 경우 받음.
//		포지션 : CHECK('LEADER','MEMBER')
//		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
