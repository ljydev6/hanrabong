package com.harmony.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.admin.model.dto.Notice;
import com.harmony.admin.service.AdminService;
import com.harmony.common.exception.HarmonyException;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String type = "";
		try {
			no = Integer.parseInt(request.getParameter("no"));
			type = "edit";
		}catch(NumberFormatException e) {
			no = -1;
			type = "write";
		}
		request.setAttribute("type", type);
		if(no>0) {
			Notice notice = AdminService.getService().selectNoticeByNo(no,false);
			if(notice!=null) {
				request.setAttribute("notice", notice);
			}else {
				throw new HarmonyException("유효하지 않은 공지글 번호입니다.");
			}
		}
		request.getRequestDispatcher("/views/admin/views/noticewrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath("/image/carousel/");
		int fileMaxSize = 1024*1024*100;
		String encode = "UTF-8";
		DefaultFileRenamePolicy renamePolicy = new DefaultFileRenamePolicy();
		MultipartRequest req = new MultipartRequest(request, path, fileMaxSize, encode, renamePolicy);
		String type = req.getParameter("type");
		
		response.sendRedirect("");
	}

}
