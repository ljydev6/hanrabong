package com.harmony.board.info.model.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CommentBoard {
	private int infComNo;
	private int infComTitNo;
	private int infComWriter;
	private String infComContent;
	private Timestamp infComDate;

}
