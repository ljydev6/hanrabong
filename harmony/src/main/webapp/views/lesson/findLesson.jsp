<%@page import="com.harmony.lesson.dto.Lesson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Lesson> lessons = (List<Lesson>)request.getAttribute("lessons");
%>
<%@ include file="/views/common/header.jsp"%>
    <script src="https://kit.fontawesome.com/8f05e1d322.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/lesson/findLesson.css">
	<section class="container w-75">
        <div class="d-flex flex-column">
            <div style="height: 50px;"></div>
            <div class="w-100 searchFilter align-items-center d-flex justify-content-between">
                <div>레슨 검색</div>
            
                <div class="filterBtns p-2">
                  <button onclick="searchOrderByViews();">조회수</button>
                  <button onclick="searchOrderByDate()">최근등록순</button>
                  <button onclick="searchOrderByStar()">별점순</button>
                  <button onclick="searchOrderByReviews()">리뷰순</button>
                </div>
                <!-- <div>
                    <input type="text">
                    <button class="searchBtn">검색</button>
                </div> -->
            </div>
            <div class="contentContainer d-flex justify-content-between">
                <article class="leftCategory w-25 align-items-center">
                    <div>
                      <div class="slideToggle" id="instrument"><i class="fa-solid fa-drum"></i> 악기별</div>
                      <ul>
                      	<!-- <li><input class="btn-check" type="radio" name="instrument" value="I" id="instAll"><label class="btn btn-outline-warning" for="instAll">전체</label></li> -->
                        <li><input class="btn-check" type="radio" name="f" value="INST_1" id="drum"><label class="btn btn-outline-warning" for="drum">드럼</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_2" id="bass"><label class="btn btn-outline-warning" for="bass">베이스</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_3" id="doublebass"><label class="btn btn-outline-warning" for="doublebass">더블베이스</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_4" id="gittar"><label class="btn btn-outline-warning" for="gittar">기타</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_5" id="piano"><label class="btn btn-outline-warning" for="piano">피아노</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_6" id="composition" ><label class="btn btn-outline-warning" for="composition">작곡</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_7" id="saxophone"><label class="btn btn-outline-warning" for="saxophone">색소폰</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_8" id="trumpet"><label class="btn btn-outline-warning" for="trumpet">트럼펫</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_9" id="flute"><label class="btn btn-outline-warning" for="flute">플룻</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_10" id="violin"><label class="btn btn-outline-warning" for="violin">바이올린</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_11" id="cello"><label class="btn btn-outline-warning" for="cello">첼로</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_12" id="percussion"><label class="btn btn-outline-warning" for="percussion">퍼커션</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_13" id="vocal" ><label class="btn btn-outline-warning" for="vocal">보컬</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_14" id="daw"><label class="btn btn-outline-warning" for="daw">믹싱(DAW)</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="INST_15" id="etc"><label class="btn btn-outline-warning" for="etc">ETC</label></li>
                      </ul>
                    </div>
                    <div>
                      <div class="slideToggle"><i class="fa-solid fa-location-dot"></i> 장소별</div>
                      <ul class="liLists">
                        <li><input class="btn-check" type="radio" name="f" value="서울" id="seoul" ><label class="btn btn-outline-warning" for="seoul">서울</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="인천" id="incheon" ><label class="btn btn-outline-warning" for="incheon">인천</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="경기" id="gyeonggi" ><label class="btn btn-outline-warning" for="gyeonggi">경기</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="강원" id="gangwon" ><label class="btn btn-outline-warning" for="gangwon">강원</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="충북" id="choungbuk" ><label class="btn btn-outline-warning" for="choungbuk">충북</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="충남" id="choungnam" ><label class="btn btn-outline-warning" for="choungnam">충남</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="전북" id="jeonbuk" ><label class="btn btn-outline-warning" for="jeonbuk">전북</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="전남" id="jeonnam" ><label class="btn btn-outline-warning" for="jeonnam">전남</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="경북" id="gyeongbuk" ><label class="btn btn-outline-warning" for="gyeongbuk">경북</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="경남" id="gyeongnam" ><label class="btn btn-outline-warning" for="gyeongnam">경남</label></li>
                        <li><input class="btn-check" type="radio" name="f" value="제주" id="jeju" ><label class="btn btn-outline-warning" for="jeju">제주</label></li>
                      </ul>
                    </div>
                    <div>
                        <div class="slideToggle"><i class="fa-solid fa-barcode"></i> 가격별</div>
	                      <ul class="liLists">
	                        <li><input class="btn-check" type="radio" name="f" value="100,000" id="10" ><label class="btn btn-outline-warning" for="10">10만원</label></li>
	                        <li><input class="btn-check" type="radio" name="f" value="150,000" id="15" ><label class="btn btn-outline-warning" for="15">15만원</label></li>
	                        <li><input class="btn-check" type="radio" name="f" value="200,000" id="20" ><label class="btn btn-outline-warning" for="20">20만원</label></li>
	                        <li><input class="btn-check" type="radio" name="f" value="250,000" id="25" ><label class="btn btn-outline-warning" for="25">25만원</label></li>
	                        <li><input class="btn-check" type="radio" name="f" value="협의가능" id="discuss" ><label class="btn btn-outline-warning" for="discuss">협의가능</label></li>
	                      </ul>
                    </div>
                    <div>
                        <div class="slideToggle"><i class="fa-regular fa-clock"></i> 시간대별</div>
	                      <ul class="liLists">
	                        <li><input class="btn-check" type="radio" name="f" value=12 id="morning" ><label class="btn btn-outline-warning" for="morning">오전</label></a></li>
	                        <li><input class="btn-check" type="radio" name="f" value=18 id="evening" ><label class="btn btn-outline-warning" for="evening">오후</label></a></li>
	                        <li><input class="btn-check" type="radio" name="f" value=24 id="night" ><label class="btn btn-outline-warning" for="night">야간</label></a></li>
	                      </ul>
                    </div>
                </article>
                
                <article class="rightLessonLists w-100 p-5" id="rightLessonLists">
                    <div class="lessonListBox">
                   	<%for(Lesson l : lessons){
                   	if(!lessons.isEmpty()) {%>
                      <div class="lessonList" onclick="location.href='<%=request.getContextPath()%>/lesson/lessonInfo.do?no=<%=l.getBoardNo() %>'">
                      <%if(l.getBoardImg()!=null) {%>
                        <div class="lessonListImageBox"><img src="<%=request.getContextPath()%>/upload/lesson/<%=l.getBoardImg()%>" width="100%" height="200px"></div>
                        <%} else { %>
                        <div class="lessonListImageBox"><img src="<%=request.getContextPath()%>/images/default.jpg" width="200px" height="200px"></div>
                        <%} %>
                        <div class="lessonListTitle"><%=l.getBoardTitle() %>&nbsp;</div>
                        <div class="lessonStars">
                        	<i class="fa-solid fa-star"><%=l.getReviewPoint() %></i>
                        </div>
                        <div class="lessonView">
                        	<i class="fa-regular fa-eye fa-sm">&nbsp;<%=l.getBoardView() %></i>
                        </div>
                      </div>
                      		<%} %>
                     	<%} %>
                    </div>
                    <div class="pageBar"><%=request.getAttribute("pageBar") %></div>
                </article>
                
                <!-- 조회수순 -->
                <script>
	                function searchOrderByViews() {
	            		$.ajax({
	        				url:"<%=request.getContextPath()%>/FindLessonFilterContentsServlet.do?viewAndRecent=BOARD_VIEW_COUNT",
	        				type:'GET',
	        				dataType:"json",
	       					success:function(data){
	       						const lessonListBox = $("<div>");
	       						lessonListBox.addClass('lessonListBox');
	       						data.forEach(e=>{
	       							let boardNo = e['boardNo'];
	       							let imgPath = "<%=request.getContextPath()%>/upload/lesson/"+e['boardImg'];
	       							let goToLessonInfoPath = "location.href='<%=request.getContextPath()%>/lesson/lessonInfo.do?no=boardNo'";
	       							goToLessonInfoPath = goToLessonInfoPath.replace('boardNo',boardNo);
		       						const lessonList = $("<div>");
		       						lessonList.addClass('lessonList');
		       						lessonList.attr('onclick', goToLessonInfoPath);
		       						const lessonListImageBox = $("<div>").addClass('lessonListImageBox');
		       						const img = $("<img>");
		       						img.attr('src', imgPath);
		       						img.attr('width','100%').attr('height','200px');
		       						lessonListImageBox.append(img);
		       						
		       						const lessonListTitle = $("<div>").addClass('lessonListTitle').text(e['boardTitle']);
		       						
		       						const lessonView = $("<div>");
		       						lessonView.addClass('lessonView');
		       						const i = $("<i>");
		       						i.addClass('fa-regular fa-eye fa-sm').text(" "+e['boardView'] );
		       						lessonView.append(i);
	       							
		       						const lessonStars = $("<div>");
	       							lessonStars.addClass('lessonStars');
	       							const starsi = $("<i>");
	       							starsi.addClass('fa-solid fa-star').text(" "+e['reviewPoint']);
	       							lessonStars.append(starsi);
	       							
	       							
		       						lessonList.append(lessonStars).append(lessonView).append(lessonListImageBox).append(lessonListTitle);
		       				
		       						lessonListBox.append(lessonList);
		       						
		       						const pageBar = $("<div>")
		       						pageBar.addClass('pageBar')
		       						pageBar.append("<%=request.getAttribute("pageBar") %>");
	       						});
	       						$(".rightLessonLists").html(lessonListBox).append(pageBar);
	       					}
	        			});
					}
                </script>
                <!-- 최근등록순 -->
                <script>
	                function searchOrderByDate() {
	                	$.ajax({
	        				url:"<%=request.getContextPath()%>/FindLessonFilterContentsServlet.do?viewAndRecent=BOARD_DATE",
	        				type:'GET',
	        				dataType:"json",
	       					success:function(data){
	       						const pageBar = $("<div>")
	       						pageBar.append("<%=request.getAttribute("pageBar") %>");
	       						const lessonListBox = $("<div>");
	       						lessonListBox.addClass('lessonListBox');
	       						data.forEach(e=>{
	       							let boardNo = e['boardNo'];
	       							let imgPath = "<%=request.getContextPath()%>/upload/lesson/"+e['boardImg'];
	       							let goToLessonInfoPath = "location.href='<%=request.getContextPath()%>/lesson/lessonInfo.do?no=boardNo'";
	       							goToLessonInfoPath = goToLessonInfoPath.replace('boardNo',boardNo);
		       						const lessonList = $("<div>");
		       						lessonList.addClass('lessonList');
		       						lessonList.attr('onclick', goToLessonInfoPath);
		       						const lessonListImageBox = $("<div>").addClass('lessonListImageBox');
		       						const img = $("<img>");
		       						img.attr('src', imgPath);
		       						img.attr('width','100%').attr('height','200px');
		       						lessonListImageBox.append(img);
		       						
		       						const lessonListTitle = $("<div>").addClass('lessonListTitle').text(e['boardTitle']);
		       								       						
		       						const lessonView = $("<div>");
		       						lessonView.addClass('lessonView');
		       						const viewi = $("<i>");
		       						viewi.addClass('fa-regular fa-eye fa-sm').text(" "+e['boardView'] );
		       						lessonView.append(viewi);
		       						
		       						const lessonStars = $("<div>");
	       							lessonStars.addClass('lessonStars');
	       							const starsi = $("<i>");
	       							starsi.addClass('fa-solid fa-star').text(" "+e['reviewPoint']);
	       							lessonStars.append(starsi);
	       							
	       							
		       						lessonList.append(lessonStars).append(lessonView).append(lessonListImageBox).append(lessonListTitle);
		       				
		       						lessonListBox.append(lessonList);
	       						});
	       						$(".rightLessonLists").html(lessonListBox).append(pageBar);
	       					}
	        			});
					}
                </script>
                <script>
                /* 평균별점순 */
	                function searchOrderByStar() {
	                	$.ajax({
	        				url:"<%=request.getContextPath()%>/FindLessonFilterContentsServlet.do?",
	        				type:'GET',
	        				dataType:"json",
	       					success:function(data){
	       						const pageBar = $("<div>")
	       						pageBar.append("<%=request.getAttribute("pageBar") %>");
	       						const lessonListBox = $("<div>");
	       						lessonListBox.addClass('lessonListBox');
	       						data.forEach(e=>{
	       							let boardNo = e['boardNo'];
	       							let imgPath = "<%=request.getContextPath()%>/upload/lesson/"+e['boardImg'];
	       							let goToLessonInfoPath = "location.href='<%=request.getContextPath()%>/lesson/lessonInfo.do?no=boardNo'";
	       							goToLessonInfoPath = goToLessonInfoPath.replace('boardNo',boardNo);
		       						const lessonList = $("<div>");
		       						lessonList.addClass('lessonList');
		       						lessonList.attr('onclick', goToLessonInfoPath);
		       						const lessonListImageBox = $("<div>").addClass('lessonListImageBox');
		       						const img = $("<img>");
		       						img.attr('src', imgPath);
		       						img.attr('width','100%').attr('height','200px');
		       						lessonListImageBox.append(img);
		       						
		       						const lessonListTitle = $("<div>").addClass('lessonListTitle').text(e['boardTitle']);
		       						
		       						const lessonView = $("<div>");
		       						lessonView.addClass('lessonView');
		       						const i = $("<i>");
		       						i.addClass('fa-regular fa-eye fa-sm').text(" "+e['boardView'] );
		       						lessonView.append(i);
	       							
		       						const lessonStars = $("<div>");
	       							lessonStars.addClass('lessonStars');
	       							const starsi = $("<i>");
	       							starsi.addClass('fa-solid fa-star').text(" "+e['reviewPoint']);
	       							lessonStars.append(starsi);
	       							
		       						lessonList.append(lessonStars).append(lessonView).append(lessonListImageBox).append(lessonListTitle);
		       				
		       						lessonListBox.append(lessonList);
	       						});
	       						$(".rightLessonLists").html(lessonListBox).append(pageBar);
	       					}
	        			});
					}
                </script>
                <script>
                /* 리뷰순 */
	                function searchOrderByReviews() {
	                	$.ajax({
	        				url:"<%=request.getContextPath()%>/FindLessonFilterContentsServlet.do?no='리뷰'",
	        				type:'GET',
	        				dataType:"json",
	       					success:function(data){
	       						const pageBar = $("<div>")
	       						pageBar.append("<%=request.getAttribute("pageBar") %>");
	       						
	       						const lessonListBox = $("<div>");
	       						lessonListBox.addClass('lessonListBox');
	       						data.forEach(e=>{
	       							let boardNo = e['boardNo'];
	       							let imgPath = "<%=request.getContextPath()%>/upload/lesson/"+e['boardImg'];
	       							let goToLessonInfoPath = "location.href='<%=request.getContextPath()%>/lesson/lessonInfo.do?no=boardNo'";
	       							goToLessonInfoPath = goToLessonInfoPath.replace('boardNo',boardNo);
	       							console.log(goToLessonInfoPath);
		       						const lessonList = $("<div>");
		       						lessonList.addClass('lessonList');
		       						lessonList.attr('onclick', goToLessonInfoPath);
		       						const lessonListImageBox = $("<div>").addClass('lessonListImageBox');
		       						const img = $("<img>");
		       						img.attr('src', imgPath);
		       						img.attr('width','100%').attr('height','200px');
		       						lessonListImageBox.append(img);
		       						
		       						const lessonListTitle = $("<div>").addClass('lessonListTitle').text(e['boardTitle']);
		       						
		       						const lessonView = $("<div>");
		       						lessonView.addClass('lessonView');
		       						const i = $("<i>");
		       						i.addClass('fa-regular fa-eye fa-sm').text(" "+e['boardView'] );
		       						lessonView.append(i);
	       							
		       						const lessonStars = $("<div>");
	       							lessonStars.addClass('lessonStars');
	       							const starsi = $("<i>");
	       							starsi.addClass('fa-solid fa-star').text(" "+e['reviewPoint']);
	       							lessonStars.append(starsi);
	       							
		       						lessonList.append(lessonStars).append(lessonView).append(lessonListImageBox).append(lessonListTitle);
		       				
		       						lessonListBox.append(lessonList);
	       						});
	       						$(".rightLessonLists").html(lessonListBox).append(pageBar);
	       					}
	        			});
					}
                </script>
                <script>
				 // 필터링하기
				    let searchFilter = $("input[type=radio]");
				
				    searchFilter.click(function(){
				    	
				          let targetValue = [];//체크할때 비우고 새로체크된것만 넣는다!
				          searchFilter.filter(':checked').each(function(){ // 체크된것들만 가져오기위해 필터를한다
				        	  targetValue.push($(this).val());
				          });//each
				         let targetClass = targetValue.join("");
				         console.log(targetValue)
				         console.log(targetClass)
				         
				         searchOrderByKeyword(targetClass);
				    });
				</script>
                <script>
                /* 악기별 */
	                function searchOrderByKeyword(keyword) {
	                	$.ajax({
	        				url:"<%=request.getContextPath()%>/LeftBarFilterServlet.do?keyword="+keyword,
	        				type:'GET',
	        				dataType:"json",
	       					success:function(data){
	       						const lessonListBox = $("<div>");
	       						lessonListBox.addClass('lessonListBox');
	       						data.forEach(e=>{
	       							let boardNo = e['boardNo'];
	       							let imgPath = "<%=request.getContextPath()%>/upload/lesson/"+e['boardImg'];
	       							let goToLessonInfoPath = "location.href='<%=request.getContextPath()%>/lesson/lessonInfo.do?no=boardNo'";
	       							goToLessonInfoPath = goToLessonInfoPath.replace('boardNo',boardNo);
	       							console.log(goToLessonInfoPath);
		       						const lessonList = $("<div>");
		       						lessonList.addClass('lessonList');
		       						lessonList.attr('onclick', goToLessonInfoPath);
		       						const lessonListImageBox = $("<div>").addClass('lessonListImageBox');
		       						const img = $("<img>");
		       						img.attr('src', imgPath);
		       						img.attr('width','100%').attr('height','200px');
		       						lessonListImageBox.append(img);
		       						
		       						const lessonListTitle = $("<div>").addClass('lessonListTitle').text(e['boardTitle']);
		       						
		       						const lessonView = $("<div>");
		       						lessonView.addClass('lessonView');
		       						const i = $("<i>");
		       						i.addClass('fa-regular fa-eye fa-sm').text(" "+e['boardView'] );
		       						lessonView.append(i);
	       							
		       						const lessonStars = $("<div>");
	       							lessonStars.addClass('lessonStars');
	       							const starsi = $("<i>");
	       							starsi.addClass('fa-solid fa-star').text(" "+e['reviewPoint']);
	       							lessonStars.append(starsi);
	       							
		       						lessonList.append(lessonStars).append(lessonView).append(lessonListImageBox).append(lessonListTitle);
		       						lessonListBox.append(lessonList);
	       						});
	       						$(".rightLessonLists").html(lessonListBox);
	       					}
	        			});
					}
                </script>
            </div>
        </div>
    </section>
    
    <script>
      $(document).ready(function(){
           $(".slideToggle").click(function(e){
              $(e.target).next().slideToggle();      
           });
        });
    </script>
<%@ include file="/views/common/footer.jsp" %>