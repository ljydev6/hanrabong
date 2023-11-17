/**
 * 
 */
const addDelfile = (e)=>{
	const $target = $(e.currentTarget);
	const no = $target.parent().val();
	$('input[name="delFile"][value="'+no+'"]')[0].checked = true;
	$target.closest('li').remove();
};
let fileIndex = 0;
const addfile = (e)=>{
	const $li = $('<li>').addClass('inline-flex justify-content-end items-center w-full').attr();
	$li.append($('<input>').attr({type:'file',name:'newFile'+fileIndex++}).css({display:'none'}));
	$li.append($('<img>').attr({src:contextpath+"/image/admin/common/file.png",width:'15',height:'15'}));
	$li.append($('<span>'));
	$li.append($('<button>').attr({type:'button',name:'newDelFile',onclick:'delNewFile(event);'}).html('<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#fc3f3f" class="bi bi-x-square-fill" viewBox="0 0 16 16"> <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 4.646L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"/> </svg>'));
	
	$('#attachFileList').append($li);
	$li.find('input').first().click();
}

const delNewFile = (e)=>{
	e.stopPropagation();
	$(e.target).parent().remove();
}

const fileClick = (e)=>{
	
}