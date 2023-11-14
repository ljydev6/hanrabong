<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.harmony.admin.model.dto.Carousel" %>
<%@ include file="/views/admin/views/common/header.jsp" %>
<% List<Carousel> carousels = (List<Carousel>)request.getAttribute("carousels"); %>
<script src="<%=request.getContextPath()%>/views/admin/assets/js/carouselManage.js"></script>
        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
	          <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
	              메인화면 캐러셀 관리
	          </h2>
	          <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
              	효율적인 표시를 위해 표시되는 캐러셀의 수를 5개 정도로 유지해주세요
              <button class="btn btn-warning" onclick="addCarousel();">캐러셀 추가하기</button>
              </h4>
	          <div class="row row-cols-2 w-full whitespace-no-wrap" id="cardcontainer">
	           	<% if(carousels !=null && carousels.size()>0){ %>
	           	<%for(Carousel c : carousels){ %>
	          	<div class="card col" id="card_<%=c.getCrslNo()%>">
	          		<form action="#" method="post" enctype="multipart/form-data" class="align-items-center">
	          			<input type="hidden" name="crslNo" value="<%=c.getCrslNo()%>">
	          			<input type="hidden" name="oriImgName" value="<%=c.getCrslImgLink() %>">
		          		<img class="card-img-top" src="<%=request.getContextPath()+"/image/carousel/"+c.getCrslImgLink()%>">
		          		<ul class="list-group list-group-flush">
		          			<li class="list-group-item">
		          				<div class="input-group input-group-sm">
			          				<span class="input-group-text">이미지수정</span>
			          				<input class="form-control" type="file" name="newImage" placeholder="이미지변경시에만 입력해주세요">
			          			</div>
		          			</li>
		          			<li class="list-group-item">
		          				<div class="input-group input-group-sm">
			          				<span class="input-group-text">게시일</span>
			          				<input class="form-control" type="date" name="startDate" placeholder="게시시작일" value="<%=c.getCrslWriteDate()%>">
			          				<span class="input-group-text">~</span>
			          				<input class="form-control" type="date" name="endDate" placeholder="게시종료일" value="<%=c.getCrslEndDate()%>">
			          			</div>
		          			</li>
		          			<li class="list-group-item">
		          				<div class="input-group input-group-sm">
			          				<span class="input-group-text">표시순서</span>
			          				<input class="form-control" type="number" name="viewrank" placeholder="순번" value="<%=c.getCrslViewRank()%>">
			          				<span class="input-group-text">표시시간</span>
			          				<input class="form-control" type="number" name="intervalms" placeholder="유지시간 단위 ms" value="<%=c.getCrslIntervalMs()%>">
			          				<span class="input-group-text">ms</span>
			          			</div>
		          			</li>
		          			<li class="list-group-item">
		          				<div class="input-group input-group-sm">
			          				<span class="input-group-text">페이지링크</span>
			          				<input class="form-control" type="text" name="pagelink" placeholder="클릭시 이동할 주소를 입력해주세요" value="<%=c.getCrslPageLink()%>">
			          			</div>
		          			</li>
		          			<li class="list-group-item">
		          				<div class="row justify-content-between">
		          					<div class="col-2">
		          					<%switch(c.getStatus()){
		          					case "PENDING":%> 
		          						<span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">게시대기중</span>
		          						<%break;
                        			case "ACTIVE":%> 
                        				<span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">게시중</span>
                        				<%break;
                        			case "EXPIRED":%>
                        				<span class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">게시종료됨</span>
                        			<%break;} %>
                        			</div>
			          				<div class="col-2 flex justify-content-end space-x-4 text-sm">
			                          <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray focus:edit" aria-label="Edit">
			                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
			                              <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"></path>
			                            </svg>
			                          </button>
			                          <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray focus:delete" aria-label="Delete">
			                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
			                              <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
			                            </svg>
			                          </button>
			                        </div>
		                        </div>
		          			</li>
		          		</ul>
	          		</form>
	          	</div>
	          	<%}} %>
	          </div>
          </div>
        </main>
        <script>
        	const changeImage = (event)=>{
        		
        	}
        </script>
<%@ include file="/views/admin/views/common/footer.jsp" %>