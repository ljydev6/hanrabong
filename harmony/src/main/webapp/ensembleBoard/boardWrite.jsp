<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://code.jquery.com/jquery-3.7.1.js"></script>

<head>
<link rel="stylesheet" href="../css/boardWrite.css" type="text/css">
<meta charset="UTF-8">
<title>합주모집등록 글</title>
</head>

<body>
    <header>
        <h1>합주모집 등록~~</h1>
        <h1>등록폼~~~</h1>
    </header>    
<section class="container text-center w-75"> 

<form action="<%=request.getContextPath()%>/ensembleBoard/boardWrite.do">

    <div class="d-flex justify-content-center">
 <table id="inputdata" class="table">
    <thead class="table-dark">
    </thead>
    <tbody>
<tr>
	<th>구분</th>
    <td colspan="2">
    <input type='radio' class="single_chk" name='type' value='ama' style='display:none';>
    <span class="single_chk_span">취미</span>
	</td>
    <td colspan="2">
    <input type='radio' class="single_chk" name='type' value='pro' style='display:none';>
    <span class="single_chk_span">전문</span>
	</td>
    
    <td colspan="10"></td>
    
</tr>
<tr>
    <th>모집파트</th>
    <td>
   		<input class="inst_chk" type="checkbox" name="inst" value="vocal" style="display:none";>
		<span class="inst_chk_span">보컬</span>
    </td>
    <td>
   		<input class="inst_chk" type="checkbox" name="inst" value="piano" style="display:none";>
		<span class="inst_chk_span">건반</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="drum" style="display:none";>
		<span class="inst_chk_span">드럼</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="guitar" style="display:none";>
		<span class="inst_chk_span">기타</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="bass" style="display:none";>
		<span class="inst_chk_span">베이스</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="violin" style="display:none";>
		<span class="inst_chk_span">바이올린</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="percussion" style="display:none";>
		<span class="inst_chk_span">퍼커션</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="saxophone" style="display:none";>
		<span class="inst_chk_span">색소폰</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="flute" style="display:none";>
		<span class="inst_chk_span">플룻</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="electronic" style="display:none";>
		<span class="inst_chk_span">일렉트로닉</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="contra" style="display:none";>
		<span class="inst_chk_span">더블베이스</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="cello" style="display:none";>
		<span class="inst_chk_span">첼로</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="trumpet" style="display:none";>
		<span class="inst_chk_span">트럼펫</span>
    </td>
    <td colspan="2">
        <input type="text" name="inst" size=10 placeholder="직접 입력">
    </td>
    
</tr>
<tr>
	<th>장르</th>
	<td>
    	<input class="inst_chk" type="checkbox" name="inst" value="kpop" style="display:none";>
		<span class="inst_chk_span">가요</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="pop" style="display:none";>
		<span class="inst_chk_span">팝</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="jazz" style="display:none";>
		<span class="inst_chk_span">재즈</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="hiphop" style="display:none";>
		<span class="inst_chk_span">힙합</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="electronic" style="display:none";>
		<span class="inst_chk_span">일렉트로닉</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="rock" style="display:none";>
		<span class="inst_chk_span">락</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="modernRock" style="display:none";>
		<span class="inst_chk_span">모던락</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="funk" style="display:none";>
		<span class="inst_chk_span">펑크</span>
    </td>
    <td>
    	<input class="inst_chk" type="checkbox" name="inst" value="indie" style="display:none";>
		<span class="inst_chk_span">인디</span>
    </td>
	<td>
    	<input class="inst_chk" type="checkbox" name="inst" value="trot" style="display:none";>
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
    <input type="radio" class="single_chk" name="location" value="seoul" style="display:none";>
    <span class="single_chk_span">서울</span>
	</td>
 	<td>
    <input type='radio' class="single_chk" name='location' value='gyeongi' style='display:none';>
    <span class="single_chk_span">경기도</span>
	</td>
  	<td>
    <input type='radio' class="single_chk" name='location' value='incheon' style='display:none';>
    <span class="single_chk_span">인천</span>
	</td>
	<td>
    <input type='radio' class="single_chk" name='location' value='gangwon' style='display:none';>
    <span class="single_chk_span">강원도</span>
	</td>
	<td>
    <input type='radio' class="single_chk" name='location' value='chungcheong' style='display:none';>
    <span class="single_chk_span">충청도</span>
	</td>
	<td>
    <input type='radio' class="single_chk" name='location' value='jeolla' style='display:none';>
    <span class="single_chk_span">전라도</span>
	</td>
	<td>
    <input type='radio' class="single_chk" name='location' value='busan' style='display:none';>
    <span class="single_chk_span">부산</span>
	</td>
	<td>
    <input type='radio' class="single_chk" name='location' value='jeju' style='display:none';>
    <span class="single_chk_span">제주</span>
	</td>
    <td colspan="5"></td>
</tr>
<tr>
    <th>장소검색</th>
    <td colspan="2">
        <input type=text name="place" size=10>
    </td>
    <td colspan="12"></td>
</tr>
<tr>
    <th>요일</th>
    <td colspan="2">
    	<input class="inst_chk" type="checkbox" name="inst" value="mon" style="display:none";>
		<span class="inst_chk_span">월</span>
    </td>
    <td colspan="2">
    	<input class="inst_chk" type="checkbox" name="inst" value="tues" style="display:none";>
		<span class="inst_chk_span">화</span>
    </td>
    <td colspan="2">
		<input class="inst_chk" type="checkbox" name="inst" value="wedness" style="display:none";>
		<span class="inst_chk_span">수</span>    
    </td>
    <td colspan="2">
    	<input class="inst_chk" type="checkbox" name="inst" value="thurs" style="display:none";>
		<span class="inst_chk_span">목</span>
    </td>
    <td colspan="2">
    	<input class="inst_chk" type="checkbox" name="inst" value="fri" style="display:none";>
		<span class="inst_chk_span">금</span>
    </td>
    <td colspan="2">
    	<input class="inst_chk" type="checkbox" name="inst" value="satur" style="display:none";>
		<span class="inst_chk_span">토</span>
    </td>
    <td colspan="2">
    	<input class="inst_chk" type="checkbox" name="inst" value="sun" style="display:none";>
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
    <td colspan="2">
        <input type="button" value="추가">
    </td>
    <td colspan="2">
        <input type="button" value="삭제">
    </td>
    <td colspan="10"></td>
</tr>
<tr>
    <th>연주 영상 업로드</th>
    <td colspan="2">
        <input type="button" value="추가">
    </td>
    <td colspan="2">
        <input type="button" value="삭제">
    </td>
    <td colspan="10"></td>
</tr>
<tr>
    <th>음원 업로드</th>
    <td colspan="2">
        <input type="button" value="추가">
    </td>
    <td colspan="2">
        <input type="button" value="삭제">
    </td>
    <td colspan="10"></td>
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
</section>
<div class="submit-container">
    <input type="submit" class="btn justify-content-end">
</div>
 
</form>

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

</body>
</html>