<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>  

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/boardList.css" type="text/css">
<script src="http://code.jquery.com/jquery-3.7.1.js"></script> 

<section>
	<div class="whole_container">
		<div class="menu_bar">
	
			<h3 class="toggle1">구분</h3>
			<ul>
			   <li>취미</li>
			   <li>전문</li>
			</ul>
			<h3 class="toggle1">파트</h3>
		
			<ul>
			   <li>보컬</li>
			   <li>건반</li>
			   <li>드럼</li>
			   <li>기타</li>
			   <li>베이스</li>
			   <li>바이올린</li>
			   <li>퍼커션</li>
			   <li>색소폰</li>
			   <li>플룻</li>
			   <li>일렉트로닉</li>   
			   <li>더블베이스</li>
			   <li>첼로</li>
			   <li>트럼펫</li>
			</ul>
			<h3 class="toggle1">장르</h3>
			<ul>
			   <li>가요</li>
			   <li>팝</li>
			   <li>재즈</li>
			   <li>힙합</li>
			   <li>일렉트로닉</li>
			   <li>락</li>
			   <li>모던락</li>
			   <li>펑크</li>
			   <li>인디</li>
			   <li>트로트</li>   
			</ul>
			<h3 class="toggle1">지역</h3>
			<ul>
			   <li>서울</li>
			   <li>경기도</li>
			   <li>인천</li>
			   <li>강원도</li>
			   <li>충청도</li>
			   <li>전라도</li>
			   <li>부산</li>
			   <li>제주</li>
			</ul>
			<h3 class="toggle1">요일</h3>
			<ul>
			   <li>월</li>
			   <li>화</li>
			   <li>수</li>
			   <li>목</li>
			   <li>금</li>
			   <li>토</li>
			   <li>일</li>
			   
			</ul>
		</div>
	<div>
		<div class="board_container">
			<div class="board_list"></div>
			<div class="board_list"></div>
			<div class="board_list"></div>
		</div>
		<div class="board_container">
			<div class="board_list"></div>
			<div class="board_list"></div>
			<div class="board_list"></div>
		</div>
	</div>
</div>



</section>

<script>
   $(document).ready(function(){
   
      $(".toggle1").click(function(e){
         $(e.target).next().slideToggle();      
      });


   });
   

</script>
<%@ include file="/views/common/footer.jsp" %>  