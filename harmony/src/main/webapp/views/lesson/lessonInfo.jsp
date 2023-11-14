<%@page import="com.harmony.lesson.dto.Lesson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Lesson lesson = (Lesson)request.getAttribute("lesson");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레슨 정보보기</title>
    <script src="https://kit.fontawesome.com/8f05e1d322.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8f05e1d322.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/lesson/lessonInfo.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b314c47810b31c3c487d6f6ad04d71b1&libraries=services"></script>
</head>
<body>
	<section class="container w-50">
        <div><h1>header</h1></div>
		<div class="container">
            <!-- 카데고리, 수정, 삭제버튼 -->
			<div class="upperBar">
                <h6>악기별 > 기타</h6>
                <h4><%=lesson.getBoardTitle() %></h4>
                <div class="mb-3">
                <a href="<%=request.getContextPath()%>/lesson/enrollLesson.do">레슨 등록</a>
                    <button>수정하기</button>
                    <button>삭제하기</button>
                </div>
            </div>
			<article class="lessonInfo d-flex flex-column gap-2">
                <div class="imgSubmitSection d-flex gap-3">
                    <div class="imgContainer w-50">
                        <div class="detailImg">
                        <%if(lesson.getBoardImg()!=null) {%>
                            <img alt="이미지" src="<%=request.getContextPath()%>/upload/lesson/<%=lesson.getBoardImg()%>" width="100%">
                        <%} else { %>
                        	<img src="<%=request.getContextPath()%>/images/default.jpg" width="100%">
                        <%} %>
                        </div>
                    </div>
                    <div class="submitContainer w-50">
                        <div class="lessonSubmit d-flex flex-column">
                            <div class="labelBox d-flex flex-column p-4 mb-4">
                                <div class="mb-3"><h5>레슨상담신청</h5></div>
                                <label>
                                    <div>장소</div>
                                    <select class="form-select" name="place" id="">
                                        <option value="서울">서울</option>
                                        <option value="인천">인천</option>
                                        <option value="경기">경기</option>
                                        <option value="강원">강원</option>
                                        <option value="충청">충청</option>
                                        <option value="전라">전라</option>
                                        <option value="경상">경상</option>
                                        <option value="제주">제주</option>
                                    </select>
                                </label>
                                <label>
                                    <div>시작시간</div>
                                    <select class="form-select" name="time" id="startTime">
                                        <option value="9">09:00</option>
                                        <option value="10">10:00</option>
                                        <option value="11">11:00</option>
                                        <option value="12">12:00</option>
                                        <option value="13">13:00</option>
                                        <option value="14">14:00</option>
                                        <option value="15">15:00</option>
                                        <option value="16">16:00</option>
                                        <option value="17">17:00</option>
                                        <option value="18">18:00</option>
                                        <option value="19">19:00</option>
                                        <option value="20">20:00</option>
                                        <option value="21">21:00</option>
                                        <option value="22">22:00</option>
                                    </select>
                                </label>
                                <label>
                                    <div>종료시간</div>
                                    <select class="form-select" name="time" id="endTime">
                                        <option value="9">09:00</option>
                                        <option value="10">10:00</option>
                                        <option value="11">11:00</option>
                                        <option value="12">12:00</option>
                                        <option value="13">13:00</option>
                                        <option value="14">14:00</option>
                                        <option value="15">15:00</option>
                                        <option value="16">16:00</option>
                                        <option value="17">17:00</option>
                                        <option value="18">18:00</option>
                                        <option value="19">19:00</option>
                                        <option value="20">20:00</option>
                                        <option value="21">21:00</option>
                                        <option value="22">22:00</option>
                                    </select>
                                </label>
                                <label>
                                    <div>요일</div>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="mon" value="1"> <label class="btn btn-outline-warning" for="mon">월</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="tue" value="2"> <label class="btn btn-outline-warning" for="tue">화</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="wed" value="3"> <label class="btn btn-outline-warning" for="wed">수</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="thur" value="4"> <label class="btn btn-outline-warning" for="thur">목</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="fri" value="5"> <label class="btn btn-outline-warning" for="fri">금</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="sat" value="6"> <label class="btn btn-outline-warning" for="sat">토</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="sun" value="7"> <label class="btn btn-outline-warning" for="sun">일</label>
                                </label>
                                <label>
                                    <div>회당 레슨시간</div>
                                    <select class="form-select" name="place" id="">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </label>
                                <label>
                                    <div>횟수</div> 
                                    <select class="form-select" name="count" id="">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </label>
                                <!-- <label>
                                    <div>가격</div>
                                    <button>1회*가격</button>
                                </label> -->
                            </div>
                            <div>
                                <input type="submit" value="상담신청">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="detailInfoSection">
                    	<div>
	                        <div class="reviewInfo">리뷰 12건</div>
	                        <div class="detailInfoBar d-flex justify-content-center gap-3">
	                            <a href="#areaInfo">지역정보</a>
	                            <a href="#lessonInfo">레슨정보</a>
	                            <a href="#teacherInfo">강사정보</a>
	                            <a href="#reviewInfo">리뷰</a>
	                        </div>
	                      	<div class="detailsContainer mt-3" id="areaInfo">
                              <div class="detailsContainer_title">
                                  <div>지역정보</div>
                              </div>
                              <div class="detailsContainer_content">
                                  <div id="map" style="width:100%;height:400px;"></div>
                              </div>
                          	</div>
               				<div class="detailsContainer" id="lessonInfo">
                              <div class="detailsContainer_title" >
                                  <div>레슨정보</div>
                              </div>
                              <div class="detailsContainer_content">
                                  <div> 
                                      <div>레슨 악기</div>
                                      <input class="btn btn-outline-warning" type="text" value="<%=lesson.getInstNo() %>">
                                  </div>
                                  <div>
                                      <div>레슨비(회당)</div>
                                      <input class="btn btn-outline-warning" type="text" value="<%=lesson.getBoardPrice() %>">
                                  </div>
                                  
                                  <div>
                                      <div>시작 시간</div>
                                      <input class="btn btn-outline-warning" type="text" value="<%=lesson.getLessonStartTime() %>">
                                  </div>

                                  <div>
                                      <div>종료 시간</div>
                                      <input class="btn btn-outline-warning" type="text" value="<%=lesson.getLessonEndTime() %>">
                                  </div>
                                  
                                  <div>
                                      희망 요일
                                      <input class="btn btn-outline-warning" type="text" value="<%=lesson.getDay() %>">
                                  </div> 
                              </div>
                          </div>
                            <!-- 강사정보 -->
                          <div class="detailsContainer" id="teacherInfo">
                              <div class="detailsContainer_title" >
                                  <div>강사정보</div>
                              </div>
                              <div class="detailsContainer_content">
                                  <div></div>
                              </div>
                          </div>
                          <!-- 리뷰 -->
                          <div class="detailsContainer" id="reviewInfo">
                              <div class="detailsContainer_title">
                                  <div>리뷰</div>
                              </div>
                              <div class="detailsContainer_content">
                                  <div></div>
                              </div>
                          </div>
                    </div>
                </div>
            </article>
            <h1>footer</h1>
		</div>
	</section>
	
	<script>
		
	</script>
	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
		
		geocoder.addressSearch('<%=lesson.getBoardPlace()%>', function(result, status) { 
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=lesson.getBoardPlace()%></div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	
	/* 시작시간선택시 종료시간 disabled효과주기 */
		$("#startTime").change(()=>{
            let startTime = $("#startTime").val();
            let endTime = $("#endTime").val();
            $("#endTime option").removeAttr("disabled");
            for(let i=0; i<=startTime-9;i++){
                $("#endTime option:eq("+i+")").attr("disabled", true);
            }
        })
	</script>
</body>
</html>