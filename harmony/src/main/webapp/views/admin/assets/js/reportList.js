/**
 * 
 */

const myModal = document.getElementById('modal');
const myInput = document.getElementById('myInput');

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})
$('tr').click(e=>{
	const $target = $(e.currentTarget);
	console.log($target.attr('data-bs-value'));
	$.ajax({
		type:"get",
	    url:'/harmony/admin/ajax/report.do?no='+$target.attr('data-bs-value'),
	    data:{},
	    contentType:'application/json',
	    dataType:'json',
	    success:function(result){
	    	console.log("success : ", JSON.parse(result));
	    	const $container = $('#modal-container');
	    	$container.html('');
	    	
	    },
	    error:function(e){
	        console.log("error : ", e);
	        alert('조회 중 오류가 발생하였습니다.');
	        
	    }
    });
});
const modalData = (data)=>{
	const $data = JSON.parse(data);
	console.log($data);
	const $container = $('<div class="container">');
	const $row1 = $('<div class="">')
}