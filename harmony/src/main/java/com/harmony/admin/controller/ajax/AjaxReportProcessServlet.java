package com.harmony.admin.controller.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.harmony.admin.model.dto.Report;
import com.harmony.admin.service.AdminService;
import com.harmony.common.exception.HarmonyException;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AjaxReportProcessServlet
 */
@WebServlet("/admin/ajax/reportProcess.do")
public class AjaxReportProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			throw new HarmonyException("잘못된 요청입니다.");
		}
		MultipartRequest mr = new MultipartRequest(request, getServletContext().getRealPath("/upload"),"UTF-8");
		
		int rptNo = 0;
		try {
			rptNo = Integer.parseInt(mr.getParameter("rptNo"));
			if(rptNo<=0) {
				throw new RuntimeException();
			}
		}catch(Exception e) {
			throw new HarmonyException("유효하지 않은 신고번호");
		}
		String processContent = mr.getParameter("processContent");
		String processcode = mr.getParameter("processcode");
		
		Report report = Report.builder().reportNo(rptNo).proCode(processcode).result(processContent).build();
		
		int result = AdminService.getService().processReport(report);
		JsonObject json = new JsonObject();
		Gson gson = new Gson();
		if(result>0) {
			json.addProperty("result", true);
		}else {
			json.addProperty("result", false);
		}
		response.setContentType("application/json;charset=utf-8");
		gson.toJson(json,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}