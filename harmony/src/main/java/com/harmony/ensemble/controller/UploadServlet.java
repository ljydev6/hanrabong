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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/ajax/uploadFile.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("안돼!");
		
		}else {
			String path = getServletContext().getRealPath("/upload/ensemble/");
			
			MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*100, "UTF-8", new DefaultFileRenamePolicy());
			
//			String ori = mr.getOriginalFileName("upfile");
//			String rename = mr.getFilesystemName("upfile");
//			System.out.println(ori + " : " + rename);
			
			Enumeration names = mr.getFileNames();
			List<Map<String,String>> files=new ArrayList<>();
			while(names.hasMoreElements()) {
				String name=(String)names.nextElement();
				String re = mr.getFilesystemName(name);
				String ori = mr.getOriginalFileName(name);
				files.add(Map.of("rename",re,"oriName",ori));
				
			}
			files.forEach(e->{System.out.println(e);});
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
