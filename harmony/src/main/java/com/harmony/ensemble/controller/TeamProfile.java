package com.harmony.ensemble.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.harmony.ensemble.model.dto.EnsembleTeam;
import com.harmony.ensemble.model.dto.EnsembleTeamComment;
import com.harmony.ensemble.model.service.EnsembleService;

/**
 * Servlet implementation class TeamProfile
 */
@WebServlet("/ensemble/teamProfile.do")
public class TeamProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeamProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EnsembleService es = new EnsembleService();
	
		
		request.getRequestDispatcher("/views/ensemble/teamProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
