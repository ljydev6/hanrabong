<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.harmony.payment.model.dto.RefundList" %>
<%@ include file="/views/admin/views/common/header.jsp" %>
<% String pageBar = (String)request.getAttribute("pageBar"); %>
<% List<RefundList> refundList = (List<RefundList>)request.getAttribute("refundList"); %>
<% List<String[]> stateCodes = (List<String[]>)request.getAttribute("stateCodes"); %>
        <main class="h-full pb-16 overflow-y-auto">
          <!-- Remove everything INSIDE this div to a really blank page -->
          <div class="container px-6 mx-auto grid">
	          <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
	              환불요청 관리
	          </h2>
          </div>
        <div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
			<div class="w-full overflow-x-auto">
				<table class="w-full whitespace-no-wrap">
					<thead>
						<tr
							class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
							<th class="px-4 py-3">환불번호</th>
							<th class="px-4 py-3">상태</th>
							<th class="px-4 py-3">imp id</th>
							<th class="px-4 py-3">가격</th>
							<th class="px-4 py-3">환불요청일</th>
						</tr>
					</thead>
					<tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800 mb-3 border-b">
						<%if(refundList!=null && refundList.size()>0){ %>
						<% for(RefundList r:refundList){%>
						<tr data-bs-value="<%=r.getRefundHisNo() %>" data-bs-toggle="modal" data-bs-target="#modal">
							<td class="px-4 py-1 text-sm"><%=r.getRefundHisNo() %></td>
							<td class="px-4 py-1">
								<%switch(r.getRefundStateCode()){ 
								case "110": %>
								<span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
		                          환불대기
		                        </span>
								<%break; 
								case "210": %>
								<span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
		                          환불완료
		                        </span>
								<%break; 
								case "410": %>
								<span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
		                          환불취소
		                        </span>
								<%break; 
								case "411": %>
								<span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
		                          환불거절
		                        </span>
								<%break; 
								} %>
							</td>
							<td class="px-4 py-1 text-sm"><%=r.getImpUid() %></td>
							<td class="px-4 py-1 text-xs"><%=r.getPrice() %></td>
							<td class="px-4 py-1 text-sm"><%=r.getRefundReqDate() %></td>
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
</main>
<div class="modal fade" id="modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
		<div class="modal-content">
			<form id="report-modal-form" method="post">
			<div class="modal-header bg-gray-50 dark:bg-gray-800">
				<h1 class="modal-title fs-5 font-semibold tracking-wide text-left text-gray-500 dark:text-gray-400 ">환불 상세내역</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid" id="modal-container">
					<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
						<div class="row mb-3 border-b px-2 py-1 d-flex flex-row">
							<div class="col input-group input-group-sm">
								<span class="input-group-text text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">No.</span>
								<input class="form-control" type="text" name="rptNo" id="rptNo">
							</div>
							<div class="col  justify-content-center" id="category">
								<span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
		                          lesson
		                        </span>
							</div>
						</div>
						<div class="row d-flex flex-row wrapmb-3 border-b px-2 py-1">
							<div class="col input-group input-group-sm justify-content-center">
								<div>
									<span class="input-group-text text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">신고자</span>
									<input class="form-control" type="text" name="reporter" id="reporter" value="" readOnly>
								</div>
							</div>
							<div class="col input-group input-group-sm justify-content-center">
								<div>
									<span class="input-group-text text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">피신고자</span>
									<input class="form-control" type="text" name="reporter" id="reportee" value="" readOnly>
								</div>
							</div>
						</div>
						<div class="row mb-3 border-b px-2 py-1 d-flex flex-col">
							<div class="col border-b px-2 py-1">
								<span class="input-group-text text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">신고내용</span>
							</div>
							<div class="col" id="reportContent">
								신고내용
							</div>
						</div>
						<div class="row mb-3 border-b px-2 py-1">
							<div class="justify-content-between d-flex flex-row ">
								<div class="col-sm-auto d-flex flex-row">
									<span class="input-group-text text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">처리코드</span>
									<select class="form-control" name="processcode" id="processcode">
										<%for(String[] cd : stateCodes){ %>
										<option value="<%=cd[0]%>"><%=cd[1] %></option>
										<%} %>
									</select>
								</div>
							</div>
						</div>
						<div class="row mb-3 border-b px-2 py-1 d-flex flex-col">
							<div class="col input-group-text border-b text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
								
							</div>
							<div class="col">
								<textarea class="w-full" name="processContent" rows="3" style="resize:vertical;" id="processContent">처리내용</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Save changes</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	const requestPath = '<%=request.getContextPath()%>';
</script>
<%-- <script src="<%=request.getContextPath()%>/views/admin/assets/js/refundList.js"></script> --%>
<%@ include file="/views/admin/views/common/footer.jsp" %>