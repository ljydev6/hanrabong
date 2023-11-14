<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> 
<head>
<script src="//code.jquery.com/jquery-3.7.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
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
						<label>학교</label> 
						<input class="w3-input" type="text"  value="" > 
					</p>
					<p>
						<label>학과</label> 
						<input class="w3-input" type="text"  value="" > 
					</p>	
					<p class="border-bottom pb-3">
						<label>성별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						남 &nbsp; <input class="w3-radio" id="gender" name="gender" type="radio" >
					&nbsp;	여 &nbsp; <input class="w3-radio" id="gender2" name="gender" type="radio" >
						
					</p>
				
					<p>
						<label>활동지역</label> 
						<input class="w3-input" type="text" id="sample5_address" name="area" placeholder="주소">
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
							

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
	
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc95c9b42927b4f8a48697f198c5594e&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

</body>
<%@ include file="/views/common/footer.jsp" %> 