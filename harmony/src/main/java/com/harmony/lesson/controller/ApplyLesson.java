package com.harmony.lesson.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.lesson.dto.LessonApply;
import com.harmony.lesson.service.LessonService;

/**
 * Servlet implementation class ApplyLesson
 */
@WebServlet("/apply/applyLesson.do")
public class ApplyLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyLesson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		int boardNo = Integer.parseInt(request.getParameter("no"));
		String memNo = request.getParameter("memNo");
		String place = request.getParameter("place");
		int count = Integer.parseInt(request.getParameter("count"));
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		Timestamp startTime = Timestamp.valueOf(formatter.format(date) +" "+ request.getParameter("startTime"));
		Timestamp endTime = Timestamp.valueOf(formatter.format(date) +" "+ request.getParameter("endTime"));
		String[] day = request.getParameterValues("hopeDay");
		
		LessonApply applyMem = LessonApply
				.builder()
				.boardNo(boardNo)
				.memNo(memNo)
				.applyPlace(place)
				.applyNumberOfTimes(count)
				.lessonStartTime(startTime)
				.lessonEndTime(endTime)
				.lessonDay(day)
				.build();
		
		int result = new LessonService().applyLesson(applyMem);
		
		String msg,loc;
		if(result>0) {
			msg = "레슨 상담 신청에 성공하셨습니다. :)";
			loc = "/lesson/findLesson.do";
		} else {
			msg = "신청 실패 :(";
			loc = "/lesson/findLesson.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/lesson/common/msg.jsp")
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
