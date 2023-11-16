package com.harmony.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.board.free.model.dto.FreeBoard;
import com.harmony.board.model.service.FreeBoardService;
import com.harmony.common.PageBarBuilder;

/**
 * Servlet implementation class FreeBoardListServlet
 */
@WebServlet("/communitysub.do")
public class FreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cPage, numPerpage = 5;
        try {
            cPage = Integer.parseInt(request.getParameter("cPage"));
        } catch (NumberFormatException e) {
            cPage = 1;
        }
        
        List<FreeBoard> boards = new FreeBoardService().selectFreeBoard(cPage, numPerpage);
        int totalData = new FreeBoardService().selectFreeBoardCount();
        int totalPage = (int)Math.ceil((double)totalData / numPerpage);
        int pageBarSize = 5;

        String pageBar = PageBarBuilder.pageBarBuilder(cPage, numPerpage, totalData, pageBarSize, request.getRequestURI());

        request.setAttribute("boards", boards);
        request.setAttribute("pageBar", pageBar);
        request.getRequestDispatcher("/views/board/freeBoardList.jsp")
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
