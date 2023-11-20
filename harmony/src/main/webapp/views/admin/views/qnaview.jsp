<%@page import="com.harmony.admin.model.dto.NoticeAttachFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.harmony.admin.model.dto.Qna"%>
<%@ include file="/views/admin/views/common/header.jsp"%>
<%
Qna qna = (Qna) request.getAttribute("qna");
%>
<main class="h-full pb-16 overflow-y-auto">
	<div class="container px-6 mx-auto grid">
		<h2
			class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
			문의사항게시판</h2>
		<div class="w-full bg-white whitespace-no-wrap rounded-lg px-2 py-1">
			<form action="" method="post">
			<div class="row">
				<div class="col input-group">
					<span class="input-group-text">No.</span>
					<input type="text" name="qstNo" value="<%=qna.getQstNo()%>" readOnly>  
				</div>
			</div>
			</form>
		</div>
	</div>
</main>
<script>
			const viewno = '<%=qna.getQstNo()%>';
        	const editPath = '<%=request.getContextPath()%>/admin/qna/write.do';
</script>
<script
	src="<%=request.getContextPath()%>/views/admin/assets/js/boardView.js"></script>
<%@ include file="/views/admin/views/common/footer.jsp"%>