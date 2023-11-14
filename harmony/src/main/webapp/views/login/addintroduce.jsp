<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>마이페이지</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>추가정보 입력</h3>
			</div>
			<div>
				<form id="myForm" action="<%=request.getContextPath() %>/member/addIntroduce.do" method="post">
					<p>
						<label>프로필사진</label> 
						<input class="w3-input" type="file" value="" >
					</p>
					<p>
						<label>이름</label> 
						<input class="w3-input" type="text" id="name" name="name" value=""> 
					</p>
					<p>
						<label>나이</label> 
						<input class="w3-input" type="number" id="age" name="age" value="" > 
					</p>
					<p>
						<label>학력</label> 
						<input class="w3-input" type="text"  value="" > 
					</p>	
					<p class="border-bottom pb-3">
						<label>성별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						남 &nbsp; <input class="w3-radio" id="gender" name="gender" type="radio" >
					&nbsp;	여 &nbsp; <input class="w3-radio" id="gender2" name="gender" type="radio" >
						
					</p>
				
					<p>
						<label>활동지역</label> 
						<input class="w3-input"  name="area" type="text" >
					</p>
					<p>
						<label>관심장르</label>
						<select class="w3-select" name="Genre" >
							<option>힙합</option>
							<option>재즈</option>
							<option>클래식</option>
							<option>케이팝</option>
							<option>기타</option>
						</select>
					</p>
					<p>
						<label>악기</label>
						<select class="w3-select" >
							<option>기타</option>
							<option>피아노</option>
							<option>일렉기타</option>
							<option>장구</option>
						</select>
					</p>
					<p>
						<label>연주영상</label> 
						<input class="w3-input" type="file"  value="" > 
					</p>
					<p>
						<label>음원</label> 
						<input class="w3-input" type="file"  value="" > 
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">확인</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>

<%@ include file="/views/common/footer.jsp" %> 