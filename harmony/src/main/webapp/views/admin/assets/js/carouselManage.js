/**
 * 
 */

const addCarousel = ()=>{
	const $div = $('<div>').addClass('card').html('<form method="post" enctype="multipart/form-data" class="align-items-center"><input type="hidden" name="crslNo" value=""><input type="hidden" name="oriImgName" value=""><img class="card-img-top" src=""><ul class="list-group list-group-flush"><li class="list-group-item"><div class="input-group input-group-sm"><span class="input-group-text">이미지수정</span><input class="form-control" type="file" name="newImage"></div></li><li class="list-group-item"><div class="input-group input-group-sm"><span class="input-group-text">게시일</span><input class="form-control" type="date" name="startDate"><span class="input-group-text">~</span><input class="form-control" type="date" name="endDate"></div></li><li class="list-group-item"><div class="input-group input-group-sm"><span class="input-group-text">표시순서</span><input class="form-control" type="number" name="viewrank"><span class="input-group-text">표시시간</span><input class="form-control" type="number" name="intervalms"><span class="input-group-text">ms</span></div></li><li class="list-group-item"><div class="input-group input-group-sm"><span class="input-group-text">페이지링크</span><input class="form-control" type="text" name="pagelink"></div></li><li class="list-group-item"><div class="flex justify-content-end space-x-4 text-sm"><button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray" aria-label="Edit"><svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"><path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"></path></svg></button><button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray" aria-label="Delete"><svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path></svg></button></div></li></ul></form>');
	$('#cardcontainer').append($div);
	$div.focus();
};

$('[name="newImage"]').on('change',e=>{
	const $target = $(e.target);
	const $img = $target.closest('form').find('img');
	let fileReader = new FileReader();
	fileReader.readAsDataURL($target[0].files[0]);
	fileReader.onloadend = (e)=>{
		$img.attr('src',e.target.result);
	};
});
$('button[name="editBtn"]').on('click',(e)=>{
	e.preventDefault();
	const $frm = $(e.target).closest('form');
	editCarousel($frm[0]);
});

const editCarousel = (form)=>{
	const formData = new FormData(form); 
 	formData.append('type','edit');
    $.ajax({
		type:"post",
		enctype:'multipart/form-data',
	    url:'/harmony/admin/ajax/carouselManage.do',
	    data:formData,
	    dataType:'json',
	    processData:false,
	    contentType:false,
	    cache:false,
	    success:function(data){
	    	console.log("success : ", data);
	    	alert('성공적으로 수정되었습니다.');
	    },
	    error:function(e){
	        console.log("error : ", e);
	        alert('수정중 오류가 발생하였습니다.');
	        
	    }
    });
};

$('button[name="resetBtn"]').on('click',(e)=>{
	const $frm = $(e.target).closest('form');
	const $img = $frm.find('img');
	$img.attr('src','/harmony/image/carousel/'+$frm.find('[name="oldImage"]').val());
	$frm[0].reset();
});