<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.harmony.admin.model.dto.ReportList"%>
<%@ include file="/views/admin/views/common/header.jsp"%>
<% List<ReportList> reportList = (List<ReportList>)request.getAttribute("reportList");%>
<% String pageBar = (String)request.getAttribute("pageBar"); %>
<% List<String[]> processcode = (List<String[]>)request.getAttribute("processcode"); %>
<main class="h-full pb-16 overflow-y-auto">
	<div class="container px-6 mx-auto grid">
		<h2
			class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
			유저신고요청 관리</h2>
		<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
			<div class="w-full overflow-x-auto">
				<table class="w-full whitespace-no-wrap">
					<thead>
						<tr
							class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
							<th class="px-4 py-3">Category</th>
							<th class="px-4 py-3">Status</th>
							<th class="px-4 py-3">Reporter</th>
							<th class="px-4 py-3">Reportee</th>
							<th class="px-4 py-3">ReportDate</th>
						</tr>
					</thead>
					<tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800 mb-3 border-b">
						<%if(reportList!=null && reportList.size()>0){ %>
						<% for(ReportList r:reportList){%>
						<tr data-bs-value="<%=r.getReportNo()%>" data-bs-toggle="modal" data-bs-target="#modal">
							<td class="px-4 py-1">
								<%switch(r.getCatCode()){ 
								case "lesson": %>
								<span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
		                          lesson
		                        </span>
								<%break; 
								case "ensemble": %>
								<span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
		                          ensemble
		                        </span>
								<%break; 
								case "community": %>
								<span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
		                          community
		                        </span>
								<%break; 
								} %>
							</td>
							<td class="px-4 py-1 text-sm">
							<%switch(r.getProCode()){ 
								case "100": %>
								<span class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
		                          확인중
		                        </span>
								<%break; 
								case "200": %>
								<span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
		                          처리완료
		                        </span>
								<%break; 
								case "300": %>
								<span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
		                          처리지연
		                        </span>
		                        <%break; 
								case "401": %>
								<span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
		                          처리거절
		                        </span>
		                        <%break; 
								case "402": %>
								<span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
		                          처리거절
		                        </span>
								<%break; 
								} %>
							</td>
							<td class="px-4 py-1 text-xs"><%=r.getReporter() %></td>
							<td class="px-4 py-1 text-sm"><%=r.getReportee() %></td>
							<td class="px-4 py-1"><%=r.getReportDate() %></td>
						</tr>
						<%}}else{ %>
						<tr class="text-gray-700 dark:text-gray-400">
							<td colspan="5">검색결과를 찾을 수 없습니다.</td>
						</tr>
						<%} %>
					</tbody>
					<tfoot>
						<tr
							class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
							<td colspan="5"><%=pageBar %></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</main>
<div class="modal fade" id="modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
		<div class="modal-content">
			<form>
			<div class="modal-header">
				<h1 class="modal-title fs-5">신고 상세내역</h1>
				<input type="hidden" name="rptNo" value="">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid" id="modal-container">
					<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
						<div class="row mb-3 border-b px-2 py-1 d-flex flex-row">
							<div class="col" id="category">
								<span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
		                          lesson
		                        </span>
							</div>
						</div>
						<div class="row mb-3 border-b px-2 py-1">
							<div class="justify-content-between d-flex flex-row">
								<div class="col-sm-auto">
									<div>신고자</div>
									<div><input type="text" name="reporter" id="reporter" value="" readOnly></div>
								</div>
								<div class="col-sm-auto">
								<div class="col-sm-auto">
									<div>피신고자</div>
									<div><input type="text" name="reporter" id="reportee" value="" readOnly></div>
								</div>
							</div>
						</div>
						<div class="row mb-3 border-b px-2 py-1 d-flex flex-col">
							<div class="col border-b">
								신고내용
							</div>
							<div class="col" id="reportContent">
								신고내용
							</div>
						</div>
						<div class="row mb-3 border-b px-2 py-1">
							<div class="justify-content-between d-flex flex-row">
								<div class="col-sm-auto">
									<select id="template" onchange="">
										<option>5일정지</option>
										<option>일주일정지</option>
										<option>한달정지</option>
										<option>영구정지</option>
									</select>
								</div>
								<div class="col-sm-auto"></div>
								<div class="col-sm-auto">
									<select name="processcode" id="processcode">
										<%for(String[] cd : processcode){ %>
										<option value="<%=cd[0]%>"><%=cd[1] %></option>
										<%} %>
									</select>
								</div>
							</div>
						</div>
						<div class="row mb-3 border-b px-2 py-1 d-flex flex-col">
							<div class="col border-b">
								처리내용
							</div>
							<div class="col">
								<textarea class="w-full" name="processContent" rows="3" style="resize:vertical;">처리내용</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Save changes</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
		</form>
	</div>
	</div>
</div>
<script type="text/javascript">
	const requestPath = '<%=request.getContextPath()%>';
</script>
<script src="<%=request.getContextPath()%>/views/admin/assets/js/reportList.js"></script>
<%@ include file="/views/admin/views/common/footer.jsp"%>