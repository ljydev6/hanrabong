<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.util.List, 
					com.harmony.ensemble.model.dto.VChkApply"
 %>
 <%
 	List<VChkApply> applyList = (List<VChkApply>)request.getAttribute("applyList");
 %>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/chkApply.css" type="text/css">
 <script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<html>
<head>
<meta charset="UTF-8">
</head>
<body>


<%if(!applyList.isEmpty()){ 
	int index=0;
	for(VChkApply a : applyList){%>
		<%=a.getMemInfoEmail() %>	
		<%=a.getInstName() %>
		
		<input type="hidden" value="<%=a.getEnsPartIndex() %>"  id="partIndex" name="partIndex">
		<div>
			<span>[</span>
			<label>
			    <input type='radio' class="single_chk" name='chk_btn<%=index++ %>' value='Y' style="display:none" id="<%=a.getEnsPartIndex() %>">
				<span class="single_chk_span">수락</span>
			</label>
			<span>/</span>
			<label>
			 	<input type='radio' class="single_chk" name='chk_btn<%=index++ %>' value='N' style="display:none" id="<%=a.getEnsPartIndex() %>">
				<span class="single_chk_span">거절</span>
			</label>
			<span>]</span>
			<br>
		</div>
		
		<%}	
	} %>
	
		<div class="submit_container">
			<input type="button" id="submit_btn" onclick="sendData();" value="완료">
		</div>
	
	

</body>

<script>




$(document).ready(function(){
	$('.single_chk_span').click(function(){
		
		$(this).parents("div").find('.single_chk_span').removeClass('selected');
		$(this).addClass('selected');
		
		console.log($('.single_chk').val());

		
// 		$.ajax({
<%-- 			url: "<%=request.getContextPath()%>/ensemble/chkApplyEnd.do", --%>
// 			method: 'POST,
// 			data: {
// 					$data.forEach((d,i)=>{
				
// 				$('#partIndex'):JSON.stringify($('.single_chk').val())
			
// 					}
// 			}
			
// 		});	
	});
});

		
		

	
	
	
}


</script>

</html>