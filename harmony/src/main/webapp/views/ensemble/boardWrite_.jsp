<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <script src="http://code.jquery.com/jquery-3.7.1.js"></script> 

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/boardWrite.css" type="text/css">

<%@ include file="/views/common/header.jsp" %>  

<section class="container text-center w-75"> 


<input type="button" value="합주팀등록" onclick = "location.assign('<%=request.getContextPath()%>/ensemble/enrollTeam.do')" >
<input type="button" value="팀멤버등록" onclick = "location.assign('<%=request.getContextPath()%>/ensemble/addTeamMem.do')" >

<div class="form_container">

<form action="<%=request.getContextPath()%>/ensemble/boardWrite.do">
 <h2>합주모집 글 등록~~~~~</h2>
    <div class="d-flex justify-content-center">

 <table id="inputdata" class="table">
    <thead class="table-dark">
    </thead>
    <tbody>
	<tr>
		<th>글 제목</th>
			<td>
				<input type="text" id="title">
			</td>
	</tr>   
	<tr>
		<th>구분</th>
		    <td colspan="2">
			    <input type='radio' class="single_chk" name='type' value='ama' style='display:none'>
			    <span class="single_chk_span">취미</span>
			</td>
		    <td colspan="2">
			    <input type='radio' class="single_chk" name='type' value='pro' style='display:none'>
			    <span class="single_chk_span">전문</span>
			</td>
	    
	    <td colspan="10"></td>
	    
	</tr>
	<tr>
	    <th>모집파트</th>
		    <td>
		   		<input class="inst_chk" type="checkbox" name="inst" value="vocal" style="display:none">
				<span class="inst_chk_span">보컬</span>
		    </td>
		    <td>
		   		<input class="inst_chk" type="checkbox" name="inst" value="piano" style="display:none">
				<span class="inst_chk_span">건반</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="drum" style="display:none">
				<span class="inst_chk_span">드럼</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="guitar" style="display:none">
				<span class="inst_chk_span">기타</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="bass" style="display:none">
				<span class="inst_chk_span">베이스</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="violin" style="display:none">
				<span class="inst_chk_span">바이올린</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="percussion" style="display:none">
				<span class="inst_chk_span">퍼커션</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="saxophone" style="display:none">
				<span class="inst_chk_span">색소폰</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="flute" style="display:none">
				<span class="inst_chk_span">플룻</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="electronic" style="display:none">
				<span class="inst_chk_span">일렉트로닉</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="contra" style="display:none">
				<span class="inst_chk_span">더블베이스</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="cello" style="display:none">
				<span class="inst_chk_span">첼로</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="trumpet" style="display:none">
				<span class="inst_chk_span">트럼펫</span>
		    </td>
		    <td colspan="2">
		        <input type="text" name="inst" size=10 placeholder="직접 입력">
		    </td>
	    
	</tr>
	<tr>
		<th>장르</th>
			<td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="kpop" style="display:none">
				<span class="inst_chk_span">가요</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="pop" style="display:none">
				<span class="inst_chk_span">팝</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="jazz" style="display:none">
				<span class="inst_chk_span">재즈</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="hiphop" style="display:none">
				<span class="inst_chk_span">힙합</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="electronic" style="display:none">
				<span class="inst_chk_span">일렉트로닉</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="rock" style="display:none">
				<span class="inst_chk_span">락</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="modernRock" style="display:none">
				<span class="inst_chk_span">모던락</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="funk" style="display:none">
				<span class="inst_chk_span">펑크</span>
		    </td>
		    <td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="indie" style="display:none">
				<span class="inst_chk_span">인디</span>
		    </td>
			<td>
		    	<input class="inst_chk" type="checkbox" name="inst" value="trot" style="display:none">
				<span class="inst_chk_span">트로트</span>
		    </td>
		    <td colspan="2">
		        <input type="text" name="genre" size=10 placeholder="직접 입력">
		    </td>
	   		<td colspan="2"></td>
	</tr>   
	<tr>
	    <th>지역</th>
		    <td>
			    <input type="radio" class="single_chk" name="location" value="seoul" style="display:none">
			    <span class="single_chk_span">서울</span>
			</td>
		 	<td>
			    <input type='radio' class="single_chk" name='location' value='gyeongi' style='display:none'>
			    <span class="single_chk_span">경기도</span>
			</td>
		  	<td>
			    <input type='radio' class="single_chk" name='location' value='incheon' style='display:none'>
			    <span class="single_chk_span">인천</span>
			</td>
			<td>
			    <input type='radio' class="single_chk" name='location' value='gangwon' style='display:none'>
			    <span class="single_chk_span">강원도</span>
			</td>
			<td>
			    <input type='radio' class="single_chk" name='location' value='chungcheong' style='display:none'>
			    <span class="single_chk_span">충청도</span>
			</td>
			<td>
			    <input type='radio' class="single_chk" name='location' value='jeolla' style='display:none'>
			    <span class="single_chk_span">전라도</span>
			</td>
			<td>
			    <input type='radio' class="single_chk" name='location' value='busan' style='display:none'>
			    <span class="single_chk_span">부산</span>
			</td>
			<td>
			    <input type='radio' class="single_chk" name='location' value='jeju' style='display:none'>
			    <span class="single_chk_span">제주</span>
			</td>
		    <td colspan="5"></td>
	</tr>
	<tr>
	    <th>장소</th>
	   	 <td colspan="14">
			      
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
			<input type="text" id="sample6_address" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소"><br>
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	        
	    </td>
	<!--     <td colspan="9"></td> -->
	</tr>
	<tr>
	    <th>요일</th>
	    <td colspan="14" class="day">
	    	<input class="inst_chk" type="checkbox" name="inst" value="mon" style="display:none">
			<span class="inst_chk_span">월</span>
	    	<input class="inst_chk" type="checkbox" name="inst" value="tues" style="display:none">
			<span class="inst_chk_span">화</span>
			<input class="inst_chk" type="checkbox" name="inst" value="wedness" style="display:none">
			<span class="inst_chk_span">수</span>    
	    	<input class="inst_chk" type="checkbox" name="inst" value="thurs" style="display:none">
			<span class="inst_chk_span">목</span>
	    	<input class="inst_chk" type="checkbox" name="inst" value="fri" style="display:none">
			<span class="inst_chk_span">금</span>
	    	<input class="inst_chk" type="checkbox" name="inst" value="satur" style="display:none">
			<span class="inst_chk_span">토</span>
	    	<input class="inst_chk" type="checkbox" name="inst" value="sun" style="display:none">
			<span class="inst_chk_span">일</span>
	    </td>
	</tr>
	<tr>
	    <th>시간</th>
	    <td colspan="2">
	        <input type="text" name="time" size=10 placeholder="시작 시간">
	    </td>
	    <td colspan="2">
	        <input type="text" name="time" size=10 placeholder="종료 시간">
	    </td>
	     <td colspan="11"></td>
	</tr>
	
	<tr>
	    <th>멤버 프로필 등록</th>
	    <td colspan="14">
	        <input type="button" value="추가">
	        <input type="button" value="삭제">
	    </td>
	</tr>
	<tr>
	    <th>연주 영상 업로드</th>
	    <td colspan="14">
	        <input type="button" value="추가">
	          <input type="button" value="삭제">
	    </td>
	
	</tr>
	<tr>
	    <th>음원 업로드</th>
	    <td colspan="14">
	    	<input type="file" id="upFile" multiple><br><br>
	        <input type="button" value="추가" id="btnupload">
	         <input type="button" value="삭제">
	    </td>
	
	
	</tr>
	<tr>
	    <th>상세 설명</th>
	    <td colspan="14" id="detail">
	        <textarea rows="5" cols="50"></textarea>
	    </td>
	</tr>    

</tbody>
</table>

</div>
</form>
</div>
</section>

<div class="submit-container">
    <input type="submit" value="제출" class="btn justify-content-end" id="boardWrite">
</div>
 

 

<!-- 
<script>
	$("#boardWrite").click(e=>{
		const board = {
			ensBoardTitle: $("#title").val()
			ensBoardNo:
			boardDetail: $("#detail").val()
			ensBoardDate:
			ensTeamNo:
			ensBoardView:
			ensWriter:
		};
	})


</script>
 -->
<script>

	var val = document.querySelectorAll(".table tr>td")
	
	val.forEach(e=>{
	     e.addEventListener("click",e=>{
	  e.target.innerText;
	  console.log(e.target.innerText);
	  
	  
	     });
	 });


	$('.inst_chk_span,.single_chk_span').click((e)=>{
		
		const $target = $(e.target);
		if($target.attr("class").includes('single')){
			$target.parents("tr").find(".selected").removeClass("selected");
		}
		$target.prev().click();		
	});
	$('.inst_chk,.single_chk').click((e)=>{
		console.log('1213');
		const $target = $(e.target);
		console.log($target.next());
		$target.next().toggleClass('selected');
	});


</script>

<script>
	$('#btnupload').click(e=>{
		const form=new FormData();
		const fileInput=$("#upFile");
		console.log(fileInput[0].files);
		$.each(fileInput[0].files,(i,f)=>{
			/* console.log(f); */
			form.append("upfile"+i,f);
			

		});
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/uploadFile.do",
			data: form,
			type: "post",
			processData: false,
			contentType: false,
			success: data=>{
				alert("업로드 성공");
			},
			error:(r,e)=>{
				alert("업로드 실패");
			},
			complete: ()=>{
				fileInput.val('');
			}

		});
	});
</script>





<%@ include file="/views/common/footer.jsp" %>