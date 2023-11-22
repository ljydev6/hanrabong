package com.harmony.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.board.info.model.dto.InfoBoard;
import com.harmony.board.model.service.InfoBoardService;

/**
 * Servlet implementation class InfoBoardEditServlet
 */
@WebServlet("/board/boardEditEnd.do")
public class InfoBoardEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoBoardEditEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String region = request.getParameter("region");
		String category = request.getParameter("category");
		String tag = request.getParameter("tag");
	

		InfoBoard board = InfoBoard.builder()
			.infBrdNo(no)
			.infBrdTitle(title)
			.infBrdContent(content)
			.infBrdRegion(region)
			.infBrdCatNo(category)
			.infBrdTagNo(tag)
			.build();
		

		InfoBoardService service = new InfoBoardService();
		int result = service.updateBoard(board);

		String msg = result > 0 ? "게시글이 성공적으로 수정되었습니다." : "게시글 수정에 실패하였습니다.";
		String loc = "/board/boardView.do?no=" + no;

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
