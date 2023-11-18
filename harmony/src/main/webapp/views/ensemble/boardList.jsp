<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>  
<%@ page import="java.util.List, 
				com.harmony.ensemble.model.dto.EnsembleBoard,
				com.harmony.ensemble.model.dto.EnsembleTeam,
				com.harmony.ensemble.model.dto.EnsembleMember,
				com.harmony.ensemble.model.dto.EnsembleBoardWantPart,
				com.harmony.ensemble.model.dto.EnsembleTeamTime" %>
<%
	List<EnsembleBoard> boards=(List<EnsembleBoard>)request.getAttribute("boards");
%>   


<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/boardList.css" type="text/css">
<script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<main>
<aside>

	<div class="menu_bar">

	<h3 class="toggle1">구분</h3>
    <ul>
    	<li>
		    <input class="inst_chk" type="checkbox" name="inst" value="ama" style="display:none">
			<span class="inst_chk_span">취미</span>
		</li>
	    <li>
	    	<input class="inst_chk" type="checkbox" name="inst" value="pro" style="display:none">
			<span class="inst_chk_span">전문</span>
		</li>
	</ul>
			
			
			<h3 class="toggle1">파트</h3>
		
			<ul>
			
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="vocal" style="display:none">
				   <span class="inst_chk_span">보컬</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="piano" style="display:none">
				   <span class="inst_chk_span">건반</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="drum" style="display:none">
				   <span class="inst_chk_span">드럼</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="guitar" style="display:none">
				   <span class="inst_chk_span">기타</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="bass" style="display:none">
				   <span class="inst_chk_span">베이스</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="violin" style="display:none">
				   <span class="inst_chk_span">바이올린</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="percussion" style="display:none">
				   <span class="inst_chk_span">퍼커션</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="saxophone" style="display:none">
				   <span class="inst_chk_span">색소폰</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="flute" style="display:none">
				   <span class="inst_chk_span">플룻</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="electro" style="display:none">
				   <span class="inst_chk_span">일렉트로닉</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="contra" style="display:none">
				   <span class="inst_chk_span">더블베이스</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="cello" style="display:none">
				   <span class="inst_chk_span">첼로</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="trumpet" style="display:none">
				   <span class="inst_chk_span">트럼펫</span>
			   </li>
			</ul>
			<h3 class="toggle1">장르</h3>
			<ul>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="kpop" style="display:none">
				   <span class="inst_chk_span">가요</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="trumpet" style="display:none">
				   <span class="inst_chk_span">팝</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="jazz" style="display:none">
				   <span class="inst_chk_span">재즈</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="hiphop" style="display:none">
				   <span class="inst_chk_span">힙합</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="electronic" style="display:none">
				   <span class="inst_chk_span">일렉트로닉</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="rock" style="display:none">
				   <span class="inst_chk_span">락</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="modernRock" style="display:none">
				   <span class="inst_chk_span">모던락</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="funk" style="display:none">
				   <span class="inst_chk_span">펑크</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="indie" style="display:none">
				   <span class="inst_chk_span">인디</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="trot" style="display:none">
				   <span class="inst_chk_span">트로트</span>
			   </li>
			</ul>
			<h3 class="toggle1">지역</h3>
			<ul>
			   <li>
				  <input class="inst_chk" type="checkbox" name="inst" value="seoul" style="display:none">
				   <span class="inst_chk_span">서울</span>
			   </li>
			   <li>
			   <input class="inst_chk" type="checkbox" name="inst" value="gyeongi" style="display:none">
				   <span class="inst_chk_span">경기도</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="incheon" style="display:none">
				   <span class="inst_chk_span">인천</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="gangwon" style="display:none">
				   <span class="inst_chk_span">강원도</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="chungcheon" style="display:none">
				   <span class="inst_chk_span">충청도</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="jeolla" style="display:none">
				   <span class="inst_chk_span">전라도</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="busan" style="display:none">
				   <span class="inst_chk_span">부산</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="jeju" style="display:none">
				   <span class="inst_chk_span">제주</span>
			   </li>
			</ul>
			<h3 class="toggle1">요일</h3>
			<ul>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="mon" style="display:none">
				   <span class="inst_chk_span">월</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="tues" style="display:none">
				   <span class="inst_chk_span">화</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="wednes" style="display:none">
				   <span class="inst_chk_span">수</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="thurs" style="display:none">
				   <span class="inst_chk_span">목</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="fri" style="display:none">
				   <span class="inst_chk_span">금</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="satur" style="display:none">
				   <span class="inst_chk_span">토</span>
			   </li>
			   <li>
				   <input class="inst_chk" type="checkbox" name="inst" value="sun" style="display:none">
				   <span class="inst_chk_span">일</span>
			   </li>
			   
			</ul>
		</div>

</aside>

<section>
	<div class="button_container">
		<input type="button" value="합주팀등록" class="top_btn"
				onclick="location.assign('<%=request.getContextPath()%>/ensemble/enrollTeam.do')">
		<input type="button" value="팀 페이지" class="top_btn" 
				onclick="location.assign('<%=request.getContextPath()%>/ensemble/teamProfile.do')">
	</div>
	<article>
      <div class="board">
      
<%--       <%if(!boards.isEmpty()){  --%>
<%-- 			for(Board b:boards){%> --%>
      
        <div class="board_list">
<%--         <%=b.getEnsBoardTitle() %> --%>
        	<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRedCm0dGzQzPcnxZEod-
        	odzH7HE_c7fH4Bg&usqp=CAU" style="width=100px; height:100px;"
        	class="profile_img">
       		<h4>얍</h4>
       		<hr/>
        </div>
        <div class="board_list">
        	<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRedCm0dGzQzPcnxZEod-
        	odzH7HE_c7fH4Bg&usqp=CAU" style="width=100px; height:100px;"
        	class="profile_img">
        </div>
      
      </div>
    </article>

    <article>
      <div class="board">
        <div class="board_list">
        	<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRedCm0dGzQzPcnxZEod-
        	odzH7HE_c7fH4Bg&usqp=CAU" style="width=100px; height:100px;"
        	class="profile_img">
       		<h4>얍</h4>
        </div>
        <div class="board_list">
        	<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRedCm0dGzQzPcnxZEod-
        	odzH7HE_c7fH4Bg&usqp=CAU" style="width=100px; height:100px;"
        	class="profile_img">
        </div>
       
      </div>
    </article>
    
     <article>
      <div class="board">
        <div class="board_list">
        	<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRedCm0dGzQzPcnxZEod-
        	odzH7HE_c7fH4Bg&usqp=CAU" style="width=100px; height:100px;"
        	class="profile_img">
       		<h4>얍</h4>
        </div>
        <div class="board_list">
        	<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRedCm0dGzQzPcnxZEod-
        	odzH7HE_c7fH4Bg&usqp=CAU" style="width=100px; height:100px;"
        	class="profile_img">
        </div>
      
      </div>
    </article>
    
<!--     	<div id="pageBar"> -->
<%-- 		<%= request.getAttribute("pageBar") %> --%>
<!-- 	</div> -->

</section>
</main>
<script>

	$(".toggle1").next().hide();

   $(document).ready(function(){
   
      $(".toggle1").click(function(e){
         $(e.target).next().slideToggle();      
      });


   });

	$('.inst_chk_span').click((e)=>{
		
		const $target = $(e.target);
		if($target.attr("class").includes('single')){
			$target.parents("tr").find(".selected").removeClass("selected");
		}
		$target.prev().click();		
	});
	$('.inst_chk').click((e)=>{
		const $target = $(e.target);
		console.log($target.next());
		$target.next().toggleClass('selected');
	});

	
</script>
	

<%@ include file="/views/common/footer.jsp" %>  