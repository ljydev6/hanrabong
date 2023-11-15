package com.harmony.lesson.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.lesson.dto.Lesson;
import com.harmony.lesson.service.LessonService;

/**
 * Servlet implementation class LessonInfo
 */
@WebServlet("/lesson/lessonInfo.do")
public class LessonInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		Cookie[] cookies = request.getCookies();
		String readLesson ="";
		boolean readResult = false;
		for(Cookie c : cookies) {
			String name = c.getName();
			if(name.equals("readLesson")) {
				readLesson = c.getValue();
				if(readLesson.contains("|"+no+"|")) {
					readResult = true;
				}
				break;
			}
		}
		
		if(!readResult) {
			Cookie c = new Cookie("readLesson",readLesson + "|"+no+"|");
			c.setMaxAge(60*60*12);
			response.addCookie(c);
		}
		
		
		
		Lesson lesson = new LessonService().selectLessonByNo(no,readResult);
		Lesson time = new LessonService().selectTimeByNo(no);
		System.out.println(lesson);
		System.out.println(time);
		
		request.setAttribute("time", time);
		request.setAttribute("lesson", lesson);
		request.getRequestDispatcher("/views/lesson/lessonInfo.jsp")
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
