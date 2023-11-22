package com.harmony.lesson.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.lesson.dto.LessonApply;
import com.harmony.lesson.service.LessonService;
import com.harmony.model.dto.Member;

/**
 * Servlet implementation class ShowApplyInfoServlet
 */
@WebServlet("/lesson/showApplyInfo.do")
public class ShowApplyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowApplyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("no"));
		
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		
		String memNo = loginMember.getMemNo();
		LessonApply applyInfo = new LessonService().showApplyInfo(memNo);
		
		request.setAttribute("applyInfo", applyInfo);
		
		request.getRequestDispatcher("/views/lesson/ShowApplyInfoInfo.jsp")
			.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
