package com.harmony.ensemble.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.harmony.ensemble.model.dto.EnsembleBoard;
import com.harmony.ensemble.model.dto.EnsembleBoardWantPart;
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

//		
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			throw new IllegalArgumentException("노!");
//			
//		}else {
//				String path=getServletContext().getRealPath("/upload/ensemble/");
//				
//				MultipartRequest mr = new MultipartRequest(request, 
//															path, 1024*1024*200, "UTF-8", new DefaultFileRenamePolicy());
//		
//				String location = mr.getParameter("location");
//				String[] parts = mr.getParameterValues("parts");
//				String title = mr.getParameter("title");
//				String detail = mr.getParameter("detail");
//				
//				System.out.println(location+parts+title+detail);
//				
//				
//				List<EnsembleBoardWantPart> partList = new ArrayList<>();
//				
//				for(String part : parts) {
//					
//					partList.add(EnsembleBoardWantPart.builder()
//												
//												.build()
//								
//							);
//				
//				}
//		}
		EnsembleService es = new EnsembleService();
	
		//에이작스
		String data=request.getParameter("data");
		String part=request.getParameter("part");
		System.out.println("data: " + data);
		System.out.println("part: " + part);
		//json -> 전송된 데이터를 객체로 변환
		Gson gson = new Gson();
		EnsembleBoard board  = gson.fromJson(data, EnsembleBoard.class);
		System.out.println("보드" + board);
		List<String> parts = (List<String>)gson.fromJson(part, List.class);
		
		
		System.out.println(": 여기: " + parts);
		
		
//		String location = request.getParameter("location");
//		String parts = request.getParameter("parts");
		
		
		//로그인한 멤버의 회원번호와 일치하는 회원의 팀 번호 가져오기.
//				Member loginMember = (Member)request.getSession().getAttribute("loginMember");
//				String loginMemNo = loginMember.getMemNo();
//				
//				String teamNo = es.selectTeamNoByMemNo(loginMemNo);
		

		

//		EnsembleTeam ensTeam = es.writeBoard(board, parts); 
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
