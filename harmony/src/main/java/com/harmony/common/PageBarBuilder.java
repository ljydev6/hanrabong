package com.harmony.common;

import java.util.List;
import java.util.Map;

public class PageBarBuilder {
	
	public static String pageBarBuilder(int cPage, int numPerpage, int totalData, int pageBarSize, String requestURI) {
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize -1;
		StringBuilder pageBar = new StringBuilder();
		
		pageBar.append("<ul class='pagination justify-content-center'>");
		if(pageNo==1) {
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>");
		}else {
			pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+(pageNo-1)+"'>이전</a></li>");
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar.append("<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>");
			}else {
				pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+pageNo+"'>"+pageNo+"</a></li>");
			}
			pageNo++;
		}
		if(pageNo>=totalPage) {
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>");
		}else {
			pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+(pageNo)+"'>다음</a></li>");
		}
		pageBar.append("</ul>");
		
		return pageBar.toString();
	}
	
	public static String pageBarBuilderWithCategory(int cPage, int numPerpage, int totalData, int pageBarSize, String requestURI, String type, String keyword) {
	    int totalPage = (int)Math.ceil((double)totalData/numPerpage);
	    int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
	    int pageEnd = pageNo + pageBarSize -1;
	    StringBuilder pageBar = new StringBuilder();

	    pageBar.append("<ul class='pagination justify-content-center'>");
	    if(pageNo==1) {
	        pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>");
	    }else {
	        pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'>이전</a></li>");
	    }
	    while(!(pageNo>pageEnd||pageNo>totalPage)) {
	        if(pageNo==cPage) {
	            pageBar.append("<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>");
	        }else {
	            pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>"+pageNo+"</a></li>");
	        }
	        pageNo++;
	    }
	    if(pageNo>=totalPage) {
	        pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>");
	    }else {
	        pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+(pageNo)+"&type="+type+"&keyword="+keyword+"'>다음</a></li>");
	    }
	    pageBar.append("</ul>");
	    
	    return pageBar.toString();
	}
	
	public static String pageBarBuilder(int cPage, int numPerpage, int totalData, int pageBarSize, String requestURI, List<Map<String,String>> filters) {
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize -1;
		StringBuilder pageBar = new StringBuilder();
		StringBuilder filterList = new StringBuilder();
		
		for(Map<String,String> filter:filters) {
			for(Map.Entry<String,String> f : filter.entrySet()) {
				filterList.append("&"+f.getKey()+"="+f.getValue());
			}
		}
		
		pageBar.append("<ul class='pagination justify-content-center'>");
		if(pageNo==1) {
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>");
		}else {
			pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+(pageNo-1));
			pageBar.append(filterList.toString());
			pageBar.append("'>이전</a></li>");
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar.append("<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>");
			}else {
				pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+pageNo);
				pageBar.append(filterList.toString());
				pageBar.append("'>"+pageNo+"</a></li>");
			}
			pageNo++;
		}
		if(pageNo>=totalPage) {
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>");
		}else {
			pageBar.append("<li class='page-item'><a class='page-link' href='"+requestURI+"?cPage="+(pageNo));
			pageBar.append(filterList.toString());
			pageBar.append("'>다음</a></li>");
		}
		pageBar.append("</ul>");
		
		return pageBar.toString();
	}
	
}