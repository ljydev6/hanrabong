package com.harmony.ensemble.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.harmony.ensemble.model.dto.EnsembleTeamMusic;
import com.harmony.ensemble.model.dto.EnsembleTeamVideo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class EnrollTeamEndServlet
 */
@WebServlet("/ensemble/enrollTeamEnd.do")
public class EnrollTeamEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollTeamEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("노!");
			
		}else {
				String path=getServletContext().getRealPath("/upload/ensemble/");
				
				MultipartRequest mr = new MultipartRequest(request, 
															path, 1024*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
				
			Enumeration names = mr.getFileNames();
			List<Map<String,String>> files = new ArrayList<>();
			
			List<Map<String,String>> musicList = new ArrayList<>();
			List<Map<String,String>> videoList = new ArrayList<>();
			String msg ="";
			
			while(names.hasMoreElements()) {
				String name = (String)names.nextElement();
				String re = mr.getFilesystemName(name);
				String ori = mr.getOriginalFileName(name);
				files.add(Map.of("rename",re,"oriName",ori));
				
				
				int index=ori.lastIndexOf(".");
				if(index>0) {
					String extension = ori.substring(index +1);
					if(extension.equals("mp3")) {
						musicList.add(Map.of("mOri",mr.getOriginalFileName(name),"mRe",mr.getFilesystemName(name)));
						}else if(extension.equals("mp4")) {
							videoList.add(Map.of("vOri",mr.getOriginalFileName(name),"vRe",mr.getFilesystemName(name)));
						}else {
							msg= "잘못된 파일입니다.";
							System.out.println(msg);
						}
				}
			}
			files.forEach(e->{System.out.println(e);});
			
			//String userId = mr.getParameter("userId");
			//System.out.println(userId);
			
			
			System.out.println(mr.getParameter("teamName"));
			
			String teamName = mr.getParameter("teamName");
			String genre = mr.getParameter("genre");
			String type = mr.getParameter("type");
			String detail = mr.getParameter("detail");
		
			System.out.println(teamName+genre+type+detail);
			
			
			
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
