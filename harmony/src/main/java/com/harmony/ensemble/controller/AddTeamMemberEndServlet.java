package com.harmony.ensemble.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.ensemble.model.dto.EnsembleMember;
import com.harmony.ensemble.model.service.EnsembleService;
import com.harmony.model.dto.Member;

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
		
		EnsembleService es = new EnsembleService();
		String userEmail = request.getParameter("searchKeyword");
		System.out.println(userEmail);
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
//		String loginEmail = loginMember.getMemInfoEmail();
//		request.setAttribute("loginEmail", loginEmail);
		String loginMemNo = loginMember.getMemNo();
		String memNo= es.selectMemberByEmail(userEmail); //검색한 이메일의 회원넘버
		String instCode = request.getParameter("inst");	
		int result = 0;
	
		String position = request.getParameter("position");
		System.out.println(position);
		
		//이메일으로 검색되는 회원이 있을 때
		if(memNo!=null) {
					
			//포지션이 리더일 때
			if(position.equals("leader")) {
			 	result = es.insertTeamLeader(memNo, instCode);
			 	request.setAttribute("memberChk", "leader");
			}else {
			
			//포지션이 멤버일 때
				result = es.insertTeamMember(memNo, instCode);
				request.setAttribute("memberChk", "member");
			}
			
			request.setAttribute("msg","멤버 등록 완료");
			request.setAttribute("result", "1");
		}else {
			request.setAttribute("result","0");
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
