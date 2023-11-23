<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.harmony.payment.model.dto.PaymentView, com.harmony.payment.model.dto.PaymentApplyDate, java.util.List" %>
<%@ include file="/views/common/header.jsp"%>
<% PaymentView view = (PaymentView)request.getAttribute("paymentView");%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b314c47810b31c3c487d6f6ad04d71b1&libraries=services"></script>
<section class="container">
	<div class="w-100 px-5 py-3 mb-3" style="background-color: #ffc107; border-radius: 10px">
		<h3 class="h3" style="color: white">내 신청정보 보기</h3>
	</div>
	<div class="row row-cols-2">
		<div class="col">
			<div class="d-flex flex-column mb-3">
				<div class="input-group">
					<span class="input-group-text">선생님정보</span>
				</div>
				<div class="d-flex flex-row input-group">
					<span class="input-group-text">이름</span>
					<input class="form-control plane-text" type="text" id="teacherName" value="<%=view.getTeacherName()%>" readOnly>
				</div>
				<div class="d-flex flex-row input-group">
					<span class="input-group-text">성별</span>
					<input class="form-control plane-text" type="text" id="teacherGender" value="<%=view.getTeacherGender()%>" readOnly>
				</div>
				<div class="d-flex flex-row input-group">
					<span class="input-group-text">이메일</span>
					<input class="form-control plane-text" type="text" id="teacherEmail" value="<%=view.getTeacherEmail()%>" readOnly>
				</div>
				<div>
					<span class="input-group-text" id="teacherIntroduce"><%=view.getTeacherIntroduce() %></span>
				</div>
			</div>
			<div class="d-flex flex-column mb-3">
				<div class="input-group">
					<span class="input-group-text">위치</span>
				</div>
				<div class="detailsContainer_content">
                   <div id="map" style="width:100%;height:400px;"></div>
               </div>
			</div>
		</div>
		<div class="col">
			<div class="d-flex flex-column mb-3">
				<div class="input-group">
					<span class="input-group-text">레슨정보</span>
				</div>
				<%if(view.getDates()!=null && view.getDates().size()>0){ %>
				<%for(PaymentApplyDate d : view.getDates()){ %>
				<div class="d-flex flex-row input-group">
					<span class="input-group-text">요일</span>
					<input class="form-control plane-text" type="text" value="<%=d.getDayOfWeek()%>" readOnly>
					<input class="form-control" type="time" value="<%=String.valueOf(d.getStartTime()).substring(11, 16)%>" readOnly>
					<span class="input-group-text">~</span>
					<input class="form-control" type="time" value="<%=String.valueOf(d.getEndTime()).substring(11,16)%>" readOnly>
				</div>
				<%}} %>
				<div class="d-flex flex-row input-group">
					<span class="input-group-text">횟수</span>
					<input class="form-control plane-text" type="text" id="times" value="<%=view.getLessonTimes()%>" readOnly>
					<span class="input-group-text">횟수당 가격</span>
					<input class="form-control text-end" type="text" id="price" value="<%=view.getPrice()%>" readOnly>
					<span class="input-group-text">원</span>
				</div>
				<div class="d-flex flex-row input-group mb-3">
					<form  class="d-flex flex-row input-group mb-3">
					<input type="hidden" name="applyNo" id="applyNo" value="<%=view.getApplyNo()%>">
					<span class="input-group-text">총 가격</span>
					<input class="form-control text-end" type="text" name="totalprice" id="totalprice" value="<%=view.getLessonTimes()*view.getPrice()%>" readOnly>
					<span class="input-group-text">원</span>
					</form>
				</div>
				<div class="d-flex justify-content-center">
					<%if(view.getPaymentStatus()!=null && !view.getPaymentStatus().equals("100")){ %>
					<h3 class="h3" style="color: white; background-color: #ffc107; border-radius: 10px">이미 결제된 요청입니다.</h3>
					<%}else if(view.getStatus().equals("Y")){ %>
					<button class="btn btn-warning btn-lg" onclick="">결제하기</button>
					<%}else if(view.getStatus().equals("C")){ %>
					<span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-placement="bottom" data-bs-content="강사가 확인중입니다.">
					  <button class="btn btn-warning btn-lg" type="button" disabled>결제하기</button>
					</span>
					<%}else{ %>
					<span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-placement="bottom" data-bs-content="강사가 거절한 신청정보입니다.">
					  <button class="btn btn-warning btn-lg" type="button" disabled>----</button>
					</span>
					<%} %>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
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

geocoder.addressSearch('<%=view.getPlace()%>', function(result, status) { 
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
        content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=view.getPlace()%></div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
    map.setDraggable(false);
} 
});
</script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	IMP.init('imp42878223');
	
	const payment = ()=>{
		const applyNo = $('#applyNo').val();
		
	};
	
function requestPay() {
    IMP.request_pay({
      pg: "kcp.{AO09C}",
      merchant_uid: "ORD20180131-0000011",   // 주문번호
      amount: 64900,                         // 숫자 타입
    }, function (rsp) { // callback
      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
    });
  }
</script>
<%@ include file="/views/common/footer.jsp"%>