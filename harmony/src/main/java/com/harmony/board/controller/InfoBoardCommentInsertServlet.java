package com.harmony.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.board.info.model.dto.InfoCommentBoard;
import com.harmony.board.model.service.InfoBoardService;

/**
 * Servlet implementation class InfoBoardCommentInsertServlet
 */
@WebServlet("/board/insertComment.do")
public class InfoBoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoBoardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int infBrdNo = Integer.parseInt(request.getParameter("boardRef"));
        String infComWriter = request.getParameter("infComWriter");
        String infComContent = request.getParameter("content");
        int infComLevel = Integer.parseInt(request.getParameter("level"));
        String infComNoRefStr = request.getParameter("infComNoRef");
        Integer infComNoRef = (infComNoRefStr != null && !infComNoRefStr.isEmpty()) ? 
                                    Integer.parseInt(infComNoRefStr) : null;

        InfoCommentBoard comment = InfoCommentBoard.builder()
            .infBrdNo(infBrdNo)
            .infComWriter(infComWriter)
            .infComContent(infComContent)
            .infComLevel(infComLevel)
            .infComNoRef(infComNoRef)
            .build();

        InfoBoardService service = new InfoBoardService();
        int result = service.insertBoardComment(comment);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/board/boardView.do?no=" + infBrdNo);
        } else {
            request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
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
