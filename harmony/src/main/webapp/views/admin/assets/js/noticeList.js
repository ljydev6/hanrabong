/**
 * 
 */

$('tbody tr').on('click',(e)=>{
	const no = $(e.currentTarget).find('th');
	console.log(no.text());
	location.href=contextPath+"/admin/notice?no="+no.text();
});