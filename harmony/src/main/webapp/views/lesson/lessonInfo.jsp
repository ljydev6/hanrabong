<%@page import="com.harmony.lesson.dto.LessonApply"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.harmony.lesson.dto.Lesson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Lesson lesson = (Lesson)request.getAttribute("lesson");
	Lesson time = (Lesson)request.getAttribute("time");
	List<LessonApply> reviews = (List<LessonApply>)request.getAttribute("review");
	
	//타임스탬프형식 변환
	Timestamp TstartTime = (Timestamp)time.getLessonStartTime();
	Timestamp TendTime = (Timestamp)time.getLessonEndTime();
	
	String startString = String.valueOf(TstartTime);
	String EndString = String.valueOf(TendTime);
	
	String startTime = startString.substring(11, 16);
	String endTime = EndString.substring(11, 16);
	
	//배열을 문자열로 변환
	String[] timeStrings = time.getDay();
	String timeString = Arrays.toString(timeStrings);
	
	//악기 변환
	String inst = lesson.getInstNo();
%>
<%@ include file="/views/common/header.jsp"%>
    <script src="https://kit.fontawesome.com/8f05e1d322.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/lesson/lessonInfo.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b314c47810b31c3c487d6f6ad04d71b1&libraries=services"></script>
	<section class="container w-50">
        <div><h2><%=lesson.getBoardTitle() %></h2></div>
		<div class="container">
            <!-- 카데고리, 수정, 삭제버튼 -->
			<div class="upperBar">
				<div class="category">
					<input class="btn" value="악기 >" readonly>
	                <input class="btn" readonly type="text" 
                                      <% switch (inst) {
                                      	case "INST_1" :%>value="드럼";break;
                                      <% case "INST_2" :%>value="베이스";break;
                                      <% case "INST_3" :%>value="더블베이스";break;
                                      <% case "INST_4" :%>value="기타";break;
                                      <% case "INST_5" :%>value="피아노";break;
                                      <% case "INST_6" :%>value="작곡";break;
                                      <% case "INST_7" :%>value="색소폰";break;
                                      <% case "INST_8" :%>value="트럼펫";break;
                                      <% case "INST_9" :%>value="플룻";break;
                                      <% case "INST_10" :%>value="바이올린";break;
                                      <% case "INST_11" :%>value="첼로";break;
                                      <% case "INST_12" :%>value="퍼커션";break;
                                      <% case "INST_13" :%>value="보컬";break;
                                      <% case "INST_14" :%>value="믹싱(DAW)";break;
                                      <% case "INST_15" :%>value="ETC";break;
                                      <%} %>
                                      >
                 </div>                     
                
                <div class="mb-3">
                <a href="<%=request.getContextPath()%>/lesson/enrollLesson.do">레슨 등록</a>
                    <button onclick="location.href='<%=request.getContextPath()%>/lesson/updateLesson.do?no=<%=lesson.getBoardNo()%>'">수정하기</button>
                    <button onclick="location.href='<%=request.getContextPath()%>/lesson/deleteLesson.do?no=<%=lesson.getBoardNo()%>'">삭제하기</button>
                </div>
            </div>
			<article class="lessonInfo d-flex flex-column gap-2">
                <div class="imgSubmitSection d-flex gap-3">
                    <div class="imgContainer w-50">
                        <div class="detailImg">
                        <div class="saveLesson">
                            <i class="fa-solid fa-heart fa-xs"></i>
                    	</div>
                        <%if(lesson.getBoardImg()!=null) {%>
                            <img alt="이미지" src="<%=request.getContextPath()%>/upload/lesson/<%=lesson.getBoardImg()%>" width="100%">
                        <%} else { %>
                        	<img src="<%=request.getContextPath()%>/image/lesson/default.jpg" width="100%">
                        <%} %>
                        </div>
                    </div>
                    <div class="submitContainer w-50">
                        <div class="lessonSubmit d-flex flex-column">
                        	<form action="<%=request.getContextPath() %>/apply/applyLesson.do?no=<%=lesson.getBoardNo()%>" method="post">
                        	<!-- 강사번호 바꿔야함 -->
                        	<input type="hidden" value="MEM_11" name="memNo">
                            <div class="labelBox d-flex flex-column p-4 mb-4">
                                <div class="mb-3"><h5>레슨상담신청</h5></div>
                                <label>
                                    <div>장소</div>
                                    <select class="form-select" name="place" id="place" required>
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
	                                    <select class="form-select" name="startTime" id="startTime">
                                                <option value="09:00:00.0">09:00</option>
                                                <option value="10:00:00.0">10:00</option>
                                                <option value="11:00:00.0">11:00</option>
                                                <option value="12:00:00.0">12:00</option>
                                                <option value="13:00:00.0">13:00</option>
                                                <option value="14:00:00.0">14:00</option>
                                                <option value="15:00:00.0">15:00</option>
                                                <option value="16:00:00.0">16:00</option>
                                                <option value="17:00:00.0">17:00</option>
                                                <option value="18:00:00.0">18:00</option>
                                                <option value="19:00:00.0">19:00</option>
                                                <option value="20:00:00.0">20:00</option>
                                                <option value="21:00:00.0">21:00</option>
                                                <option value="22:00:00.0">22:00</option>
                                         </select>
                                </label>
                                <label>
                                    <div>종료시간</div>
	                                    <select class="form-select" name="endTime" id="endTime">
                                                <!-- <option value="09:00:00.0">09:00</option> -->
                                                <option value="09:00:00.0">09:00</option>
                                                <option value="10:00:00.0">10:00</option>
                                                <option value="11:00:00.0">11:00</option>
                                                <option value="12:00:00.0">12:00</option>
                                                <option value="13:00:00.0">13:00</option>
                                                <option value="14:00:00.0">14:00</option>
                                                <option value="15:00:00.0">15:00</option>
                                                <option value="16:00:00.0">16:00</option>
                                                <option value="17:00:00.0">17:00</option>
                                                <option value="18:00:00.0">18:00</option>
                                                <option value="19:00:00.0">19:00</option>
                                                <option value="20:00:00.0">20:00</option>
                                                <option value="21:00:00.0">21:00</option>
                                                <option value="22:00:00.0">22:00</option>
                                         </select>
                                </label>
                                <label>
                                    <div>요일</div>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="mon" value="월"> <label class="btn btn-outline-warning" for="mon">월</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="tue" value="화"> <label class="btn btn-outline-warning" for="tue">화</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="wed" value="수"> <label class="btn btn-outline-warning" for="wed">수</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="thur" value="목"> <label class="btn btn-outline-warning" for="thur">목</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="fri" value="금"> <label class="btn btn-outline-warning" for="fri">금</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="sat" value="토"> <label class="btn btn-outline-warning" for="sat">토</label>
                                        <input class="btn-check" type="checkbox" name='hopeDay' id="sun" value="일"> <label class="btn btn-outline-warning" for="sun">일</label>
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
                            </form>
                        </div>
                    </div>
                </div>

                <div class="detailInfoSection">
                    	<div>
	                        <div class="reviewInfo"> 리뷰 ??건 &nbsp; <i class="fa-regular fa-eye"></i>&nbsp;<%=lesson.getBoardView() %> </div>
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
                                      <input readonly class="btn btn-outline-warning" type="text" 
                                      <% switch (inst) {
                                      	case "INST_1" :%>value="드럼";break;
                                      <% case "INST_2" :%>value="베이스";break;
                                      <% case "INST_3" :%>value="더블베이스";break;
                                      <% case "INST_4" :%>value="기타";break;
                                      <% case "INST_5" :%>value="피아노";break;
                                      <% case "INST_6" :%>value="작곡";break;
                                      <% case "INST_7" :%>value="색소폰";break;
                                      <% case "INST_8" :%>value="트럼펫";break;
                                      <% case "INST_9" :%>value="플룻";break;
                                      <% case "INST_10" :%>value="바이올린";break;
                                      <% case "INST_11" :%>value="첼로";break;
                                      <% case "INST_12" :%>value="퍼커션";break;
                                      <% case "INST_13" :%>value="보컬";break;
                                      <% case "INST_14" :%>value="믹싱(DAW)";break;
                                      <% case "INST_15" :%>value="ETC";break;
                                      <%} %>
                                      >
                                  </div>
                                  <div>
                                      <div>레슨비(회당)</div>
                                      <input readonly class="btn btn-outline-warning" type="text" value="<%=lesson.getBoardPrice() %>">
                                  </div>
                                  
                                  <div>
                                      <div>시작 시간</div>
                                      <input readonly class="btn btn-outline-warning" type="text" value="<%=startTime %>">
                                  </div>

                                  <div>
                                      <div>종료 시간</div>
                                      <input readonly class="btn btn-outline-warning" type="text" value="<%=endTime %>">
                                  </div>
                                  
                                  <div>
                                      희망 요일
                                      <input readonly class="btn btn-outline-warning" type="text" value="<%=timeString %>">
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
                          <div class="rewiewContainer" id="reviewInfo">
                              <div class="mb-3">리뷰</div>
                              <%for(LessonApply l : reviews){ %>
                              <div class="avataMemberStarDate">
                              	<div><i class="fa-solid fa-user-astronaut fa-lg"></i></i></div>
                              	<div class="memberStarDate">
                              		<div>
                               			<%=l.getMemNo() %>
                               		</div>
                               		<div class="starDate">
                               			<%for(int i=0;i<l.getReviewPoint();i++){ %>
                               				<i class="fa-solid fa-star"></i>
                               			<%} %>
                                		<%=l.getReviewPoint() %> |
                                		<%=l.getReviewEnrollDate() %>
                               		</div>
                              	</div>
                              </div>
                              
                              <div class="reviewContent">
                               	<div class="review">
                               		<%=l.getReview() %>
                               	</div>
                               	<hr>
                              </div>
                              <%} %>
                          </div>
                    </div>
                </div>
            </article>
		</div>
	</section>
	
	<script>
		$(".saveLesson").click(()=>{
			confirm('찜하시겠습니까?')
		});
	
		$("#startTime").change(()=>{
	        let startTime = ($("#startTime").val()).substr(0,2);
	        let endTime = ($("#endTime").val()).substr(0,2);
	        $("#endTime option").removeAttr("disabled");
	        // if(startTime>=endTime){
	        //     alert("종료시간은 시작시간보다 커야합니다");
	        //     for(let i=0; i<=10-endTime;i++){
	        //         $("#endTime option:eq("+i+")").attr("disabled", true);
	        //     }
	        // }
	        for(let i=0; i<=startTime-9;i++){
	            $("#endTime option:eq("+i+")").attr("disabled", true);
	        }
	    });
	    
	    /* function removeCheck() {
		 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		     document.removefrm.submit();
		 }else{   //취소
		     return false;
		 }
		} */
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
	        map.setDraggable(false);
	    } 
	});
	
	
	</script>
<%@ include file="/views/common/footer.jsp" %>