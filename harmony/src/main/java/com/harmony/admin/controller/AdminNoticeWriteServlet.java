package com.harmony.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.admin.model.dto.Notice;
import com.harmony.admin.service.AdminService;

/**
 * Servlet implementation class AdminNoticeWriteServlet
 */
@WebServlet(name="adminNoticeWrite", urlPatterns = {"/admin/notice/write.do"})
public class AdminNoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeWriteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = -1;
		try {
			Integer.parseInt(request.getParameter("no"));
		}catch(NumberFormatException e) {
			no = -1;
		}
		
		if(no>0) {
			Notice notice = AdminService.getService().selectNoticeByNo(no);
			if(notice!=null) {
				request.setAttribute("notice", notice);
			}else {
				throw new RuntimeException();
			}
		}
		request.getRequestDispatcher("/views/admin/views/noticewrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}