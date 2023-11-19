package com.harmony.ensemble.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.ensemble.model.dto.EnsembleBoard;
import com.harmony.ensemble.model.dto.EnsembleBoardWantPart;
import com.harmony.ensemble.model.dto.EnsembleTeam;
import com.harmony.ensemble.model.service.EnsembleService;


/**
 * Servlet implementation class BoardWriteEndServlet
 */
@WebServlet("/ensemble/boardWriteEnd.do")
public class BoardWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		EnsembleService es = new EnsembleService();
		
		EnsembleBoard board = EnsembleBoard.builder()
										.build();//빌더
		
		List<EnsembleBoardWantPart> partList = new ArrayList<>(); 
		
		partList.add(
						EnsembleBoardWantPart.builder()
												.build()//빌더 -> List에 넣기
						);
		
		EnsembleTeam ensTeam = es.writeBoard(board, partList); 
		//모집 글,모집파트(List) : insert
		//합주 팀 : select
											
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
