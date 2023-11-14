package com.harmony.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.board.info.model.dto.InfoBoard;
import com.harmony.board.model.service.InfoBoardService;
import com.harmony.common.PageBarBuilder;

/**
 * Servlet implementation class InfoBoardCategoryServlet
 */
@WebServlet("/community/searchcommunity.do")
public class InfoBoardCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoBoardCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String type = request.getParameter("type");
	     String keyword = request.getParameter("keyword");
	     int cPage, numPerpage=5;

	     try {
	         cPage = Integer.parseInt(request.getParameter("cPage"));
	     } catch (NumberFormatException e) {
	         cPage = 1;
	     }

	     List<InfoBoard> boards = new InfoBoardService().selectBoardByCategory(keyword, cPage, numPerpage);

	     int totalData = new InfoBoardService().selectBoardCountByCategory(keyword);
	     int pageBarSize = 5;

	     String pageBar = PageBarBuilder.pageBarBuilderWithCategory(cPage, numPerpage, totalData, pageBarSize, request.getRequestURI(), type, keyword);

	     request.setAttribute("pageBar", pageBar);

	     request.setAttribute("boards", boards);

	     request.getRequestDispatcher("/views/board/communityinfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
