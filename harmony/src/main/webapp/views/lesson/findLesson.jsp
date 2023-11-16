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
                  <button>조회수</button>
                  <button>별점순</button>
                  <button>최근등록순</button>
                  <button>클래스진행순</button>
                </div>
                <!-- <div>
                    <input type="text">
                    <button class="searchBtn">검색</button>
                </div> -->
            </div>
            <div class="contentContainer d-flex justify-content-between">
                <article class="leftCategory w-50 align-items-center">
                    <div>
                      <div class="slideToggle"><i class="fa-solid fa-drum"></i> 악기별</div>
                      <ul>
                        <li><input type="checkbox" name="instrument" id="drum"><label for="drum">드럼</label></li>
                        <li><input type="checkbox" name="instrument" id="bass"><label for="bass">베이스</label></li>
                        <li><input type="checkbox" name="instrument" id="doublebass"><label for="doublebass">더블베이스</label></li>
                        <li><input type="checkbox" name="instrument" id="gittar"><label for="gittar">기타</label></li>
                        <li><input type="checkbox" name="instrument" id="piano"><label for="piano">피아노</label></li>
                        <li><input type="checkbox" name="instrument" id="composition" ><label for="composition">작곡</label></li>
                        <li><input type="checkbox" name="instrument" id="percussion"><label for="percussion">색소폰</label></li>
                        <li><input type="checkbox" name="instrument" id="trumpet"><label for="trumpet">트럼펫</label></li>
                        <li><input type="checkbox" name="instrument" id="flute"><label for="flute">플룻</label></li>
                        <li><input type="checkbox" name="instrument" id="violin"><label for="violin">바이올린</label></li>
                        <li><input type="checkbox" name="instrument" id="cello"><label for="cello">첼로</label></li>
                        <li><input type="checkbox" name="instrument" id="percussion"><label for="percussion">퍼커션</label></li>
                        <li><input type="checkbox" name="instrument" id="vocal" ><label for="vocal">보컬</label></li>
                        <li><input type="checkbox" name="instrument" id="daw"><label for="daw">믹싱(DAW)</label></li>
                        <li><input type="checkbox" name="instrument" id="etc"><label for="etc">ETC</label></li>
                      </ul>
                      
                    </div>
                    <div class="slide"></div>
                    <div>
                      <div class="slideToggle"><i class="fa-solid fa-location-dot"></i> 장소별</div>
                      <ul>
                        <li><input type="checkbox" name="place" id="seoul" ><label for="seoul">서울</label></li>
                        <li><input type="checkbox" name="place" id="incheon" ><label for="incheon">인천</label></li>
                        <li><input type="checkbox" name="place" id="gyeonggi" ><label for="gyeonggi">경기</label></li>
                        <li><input type="checkbox" name="place" id="gangwon" ><label for="gangwon">강원</label></li>
                        <li><input type="checkbox" name="place" id="choungcheong" ><label for="choungcheong">충청</label></li>
                        <li><input type="checkbox" name="place" id="jeolla" ><label for="jeolla">전라</label></li>
                        <li><input type="checkbox" name="place" id="gyeongsang" ><label for="gyeongsang">경상</label></li>
                        <li><input type="checkbox" name="place" id="jeju" ><label for="jeju">제주</label></li>
                      </ul>
                      
                    </div>
                    <div class="slide2"></div>
                    <div>
                        <div class="slideToggle"><i class="fa-solid fa-barcode"></i> 가격별</div>
                      <ul>
                        <li><input type="checkbox" name="price" id="less10" ><label for="less10">10만원이하</label></li>
                        <li><input type="checkbox" name="price" id="less20" ><label for="less20">20만원이하</label></li>
                        <li><input type="checkbox" name="price" id="less30" ><label for="less30">30만원이하</label></li>
                        <li><input type="checkbox" name="price" id="less50" ><label for="less50">50만원이하</label></li>
                        <li><input type="checkbox" name="price" id="discuss" ><label for="discuss">협의가능</label></li>
                      </ul>
                      
                    </div>
                    <div>
                        <div class="slideToggle"><i class="fa-regular fa-clock"></i> 시간대별</div>
                      <ul>
                        <li><input type="checkbox" name="time" id="morning" ><label for="morning">오전</label></a></li>
                        <li><input type="checkbox" name="time" id="evening" ><label for="evening">오후</label></a></li>
                        <li><input type="checkbox" name="time" id="night" ><label for="night">야간</label></a></li>
                      </ul>
                      
                    </div>
                </article>
                
                <article class="rightLessonLists w-100 p-5">
                    <div class="lessonListBox justify-content-center gap-3">
                   	<%for(Lesson l : lessons){
                   	if(!lessons.isEmpty()) {%>
                      <div class="lessonList" onclick="location.href='<%=request.getContextPath()%>/lesson/lessonInfo.do?no=<%=l.getBoardNo() %>'">
                      <%if(l.getBoardImg()!=null) {%>
                        <div class="lessonListImageBox"><img src="<%=request.getContextPath()%>/upload/lesson/<%=l.getBoardImg()%>" width="200px" height="200px"></div>
                        <%} else { %>
                        <div class="lessonListImageBox"><img src="<%=request.getContextPath()%>/images/default.jpg" width="200px" height="200px"></div>
                        <%} %>
                        <div class="lessonListTitle"><%=l.getBoardTitle() %>&nbsp;</div>
                        <div class="lessonView">
                        	<i class="fa-regular fa-eye fa-sm">&nbsp;<%=l.getBoardView() %></i>
                        </div>
                        <div class="saveLesson">
                            <i class="fa-solid fa-heart fa-xs"></i>
                    	</div>
                      </div>
                      		<%} %>
                     	<%} %>
                     
                    </div>
                </article>
            </div>
        </div>
    </section>
    <script>
      $(document).ready(function(){
           $(".slideToggle").click(function(e){
              $(e.target).next().slideToggle();      
           });
        });

      $(".slideBtn").click(function(){
        $(".slide").slideToggle(500);
      });
      
      /* const menu=document.querySelector(".menu");
      const subBar=document.querySelector(".menu>.sub"); */

      let subToggle=true,i=0;

      function slide_menu(){
        if(subToggle){
          subBar.style.display="block";
          subBar.classList.remove("up");
          subBar.classList.add("down");
                
          subToggle=!subToggle;
        }else{
          subBar.classList.remove("down");
          subBar.classList.add("up");

          subToggle=!subToggle;
        }
        console.log(subBar.classList);
      }
      /* menu.addEventListener("click",slide_menu); */
    </script>
<%@ include file="/views/common/footer.jsp" %>