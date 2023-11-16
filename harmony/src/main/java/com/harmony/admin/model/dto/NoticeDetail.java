package com.harmony.admin.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NoticeDetail {
	private int noticeNo;
	private String noticeWriter;
	private String title;
	private String content;
	private Date writeDate;
	private int viewCount;
	private List<NoticeAttachFile> attachFileList;
}
