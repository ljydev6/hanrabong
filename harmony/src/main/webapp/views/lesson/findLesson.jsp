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
                <article class="leftCategory w-50 align-items-center">
                    <div>
                      <div class="slideToggle" id="instrument"><i class="fa-solid fa-drum"></i> 악기별</div>
                      <ul>
                        <li><input type="checkbox" name="instrument" value="INST_1" id="drum"><label for="drum">드럼</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_2" id="bass"><label for="bass">베이스</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_3" id="doublebass"><label for="doublebass">더블베이스</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_4" id="gittar"><label for="gittar">기타</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_5" id="piano"><label for="piano">피아노</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_6" id="composition" ><label for="composition">작곡</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_7" id="percussion"><label for="percussion">색소폰</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_8" id="trumpet"><label for="trumpet">트럼펫</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_9" id="flute"><label for="flute">플룻</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_10" id="violin"><label for="violin">바이올린</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_11" id="cello"><label for="cello">첼로</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_12" id="percussion"><label for="percussion">퍼커션</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_13" id="vocal" ><label for="vocal">보컬</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_14" id="daw"><label for="daw">믹싱(DAW)</label></li>
                        <li><input type="checkbox" name="instrument" value="INST_15" id="etc"><label for="etc">ETC</label></li>
                      </ul>
                    </div>
                    <div>
                      <div class="slideToggle"><i class="fa-solid fa-location-dot"></i> 장소별</div>
                      <ul>
                        <li><input type="checkbox" name="place" value="서울" id="seoul" ><label for="seoul">서울</label></li>
                        <li><input type="checkbox" name="place" value="인천" id="incheon" ><label for="incheon">인천</label></li>
                        <li><input type="checkbox" name="place" value="경기" id="gyeonggi" ><label for="gyeonggi">경기</label></li>
                        <li><input type="checkbox" name="place" value="강원" id="gangwon" ><label for="gangwon">강원</label></li>
                        <li><input type="checkbox" name="place" value="충청" id="choungcheong" ><label for="choungcheong">충청</label></li>
                        <li><input type="checkbox" name="place" value="전라" id="jeolla" ><label for="jeolla">전라</label></li>
                        <li><input type="checkbox" name="place" value="경상" id="gyeongsang" ><label for="gyeongsang">경상</label></li>
                        <li><input type="checkbox" name="place" value="제주" id="jeju" ><label for="jeju">제주</label></li>
                      </ul>
                    </div>
                    <div>
                        <div class="slideToggle"><i class="fa-solid fa-barcode"></i> 가격별</div>
	                      <ul>
	                        <li><input type="checkbox" name="price" value="10" id="less10" ><label for="less10">10만원이하</label></li>
	                        <li><input type="checkbox" name="price" value="20" id="less20" ><label for="less20">20만원이하</label></li>
	                        <li><input type="checkbox" name="price" value="30" id="less30" ><label for="less30">30만원이하</label></li>
	                        <li><input type="checkbox" name="price" value="50" id="less50" ><label for="less50">50만원이하</label></li>
	                        <li><input type="checkbox" name="price" value="협의가능" id="discuss" ><label for="discuss">협의가능</label></li>
	                      </ul>
                    </div>
                    <div>
                        <div class="slideToggle"><i class="fa-regular fa-clock"></i> 시간대별</div>
	                      <ul>
	                        <li><input type="checkbox" name="time" value="오전" id="morning" ><label for="morning">오전</label></a></li>
	                        <li><input type="checkbox" name="time" value="오후" id="evening" ><label for="evening">오후</label></a></li>
	                        <li><input type="checkbox" name="time" value="야간" id="night" ><label for="night">야간</label></a></li>
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
                
            </div>
        </div>
    </section>
    <script>
	 // 필터링하기
	    let searchFilter = $("input[type=checkbox]");
	
	    searchFilter.click(function(){
	          let targetValue = [];//체크할때 비우고 새로체크된것만 넣는다!
	          searchFilter.filter(':checked').each(function(){
	        	  targetValue.push("." + $(this).val());
	          });//each
	          let targetClass = targetValue.join(",");
	         console.log(targetValue)
	         console.log(targetClass)
	    });
	</script>
    <script>
      $(document).ready(function(){
           $(".slideToggle").click(function(e){
              $(e.target).next().slideToggle();      
           });
        });
    </script>
<%@ include file="/views/common/footer.jsp" %>