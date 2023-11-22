package com.harmony.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.board.free.model.dto.FreeBoard;
import com.harmony.board.model.service.FreeBoardService;

/**
 * Servlet implementation class FreeBoardEditEndServlet
 */
@WebServlet("/board/FreeBoardEditEnd.do")
public class FreeBoardEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardEditEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String noParam = request.getParameter("no");
		System.out.println(noParam);
	    if (noParam == null || noParam.equals("")) {
	        // no 파라미터가 없거나 비어있는 경우, 에러 페이지로 리다이렉트
	        request.getRequestDispatcher("/views/error.jsp").forward(request, response);
	        return;
	    }
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
	

		FreeBoard board = FreeBoard.builder()
			.freBrdNo(no)
			.freBrdTitle(title)
			.freBrdContent(content)
			.build();
		

		FreeBoardService service = new FreeBoardService();
		int result = service.updateFreeBoard(board);

		String msg = result > 0 ? "게시글이 성공적으로 수정되었습니다." : "게시글 수정에 실패하였습니다.";
		String loc = "/board/freeboardView.do?no=" + no;

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/lesson/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
