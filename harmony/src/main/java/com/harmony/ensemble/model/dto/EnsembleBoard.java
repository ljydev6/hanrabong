package com.harmony.ensemble.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EnsembleBoard {

	private String ensBoardTitle;
	private String ensBoardNo; 
	private String boardDetail;
	private Date ensBoardDate;
	private String ensTeamNo;
	private int ensBoardView;
	private String ensWriter;
	}
