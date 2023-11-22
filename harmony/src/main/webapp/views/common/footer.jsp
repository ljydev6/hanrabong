<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="modal fade" id="modalMessageBox" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
			<div class="modal-content">
				<div class="modal-header px-3 py-2">
					<h3 class="modal-title fs-5 font-semibold tracking-wide text-left text-gray-500">Message Box</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid" id="modal-container">
						<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
							<div class="row row-cols-2">
								<div class="col-3 list-group px-3 py-1" id="messageListContainer">
									<a class="list-group-item list-group-item-action active" aria-current="true">
									    The current link item
									  </a>
								</div>
								<div class="col-9" id="messageContainer">
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<footer class="container bg-yellow " id="harmony_footer">
			<div class="row">
				<div class="col-md-4 pt-5">
					<h2 class="border-bottom pb-3 border-light">이음줄</h2>
					<ul class="list-unstyled footer-link-list">
						<li> 연락처 </li>
						<li> 평일 10:00 ~ 18:00 </li>
						<li> 점심시간 12:50 ~ 13:50 제외</li>
						<li> 주말/공휴일 제외</li>
						<li> <a href="<%=request.getContextPath() %>/admin/">관리자페이지</a></li>
					</ul>
				</div>
				<div class="col-md-4 pt-5">
					<h2 class="border-bottom pb-3 border-light">팀원</h2>
					<ul class="list-unstyled footer-link-list">
						<li> 이재연 : ljydev6@gmail.com</li>
						<li> 강진하 : plutory23@gmail.com</li>
						<li> 이보연 : stuctu99@gmail.com</li>
						<li> 최경현 : ckhapf@gmail.com</li>
						<li> 유채화 : ych6681@gmail.com</li>
					</ul>
				</div>
				<div class="col-md-4 pt-5">
				</div>
		</div>
	</footer>
</body>
</html>