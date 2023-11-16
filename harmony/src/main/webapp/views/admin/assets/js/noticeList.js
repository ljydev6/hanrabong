/**
 * 
 */

$('tbody tr').on('click',(e)=>{
	const no = $(e.currentTarget).find('th');
	console.log(no.text());
	location.href=contextPath+"/admin/notice.do?no="+no.text();
});