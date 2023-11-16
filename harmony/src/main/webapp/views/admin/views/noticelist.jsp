<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.harmony.admin.model.dto.NoticeList" %>
<%@ include file="/views/admin/views/common/header.jsp" %>
<% List<NoticeList> noticeList = (List<NoticeList>)request.getAttribute("noticeList"); %>
<% String pageBar = (String)request.getAttribute("pageBar"); %>
        <main class="h-full pb-16 overflow-y-auto">
          <!-- Remove everything INSIDE this div to a really blank page -->
          <div class="container px-6 mx-auto grid">
	          <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
	              공지사항게시판
	          </h2>
          </div>
          <table class="table table-white">
          	<thead>
          		<tr>
          			<th class="col-md-1 text-sm-center" scope="col">글번호</th>
          			<th class="col-md-7 text-sm-center" scope="col">제목</th>
          			<th class="col-md-1 text-sm-center" scope="col">작성자</th>
          			<th class="col-md-1 text-sm-center" scope="col">작성일</th>
          			<th class="col-md-1 text-sm-center" scope="col">조회수</th>
          			<th class="col-md-1 text-sm-center" scope="col">첨부파일</th>
          		</tr>
          	</thead>
          	<tbody>
          		<%if(noticeList!=null&&noticeList.size()>0){ %>
          		<%for(NoticeList n:noticeList){ %>
          		<tr>
          			<th class="text-sm-center" scope="row"><%=n.getNoticeNo() %></td>
          			<td class="text-sm-center text-truncate"><%=n.getTitle() %></td>
          			<td class="text-sm-center"><%=n.getWriter() %></td>
          			<td class="text-sm-center"><%=n.getWriteDate() %></td>
          			<td class="text-sm-center"><%=n.getViewCount() %></td>
          			<td class="text-sm-center"><%=n.isHasFile()?"<img src=\""+request.getContextPath()+"/image/admin/common/file.png\" style=\"width:15px;height:15px;\" alt=\"첨부파일있음\">":"" %></td>
          		</tr>
          		<%}}else{ %>
          		<tr>
          			<td class="text-sm-center" colspan="6">검색결과가 존재하지 않습니다.</td>
          		</tr>
          		<%} %>
          	</tbody>
          	<tfoot>
          		<tr>
          			<td colspan="6">
          				<%=pageBar %>
          			</td>
          		</tr>
          	</tfoot>
          </table>
        </main>
        <script>
        	const contextPath = '<%=request.getContextPath()%>';
        </script>
        <script src="<%=request.getContextPath()%>/views/admin/assets/js/noticeList.js"></script>
<%@ include file="/views/admin/views/common/footer.jsp" %>