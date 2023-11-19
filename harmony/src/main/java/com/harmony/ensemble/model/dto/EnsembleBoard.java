package com.harmony.ensemble.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EnsembleBoard {

	private String ensBoardNo; 
	private String ensTeamNo;
	private String ensWriter;
	private String ensLocation;
	private String ensPlace;
	private String ensDetail;
	private Date ensBoardDate;
	private int ensBoardView;
	private String ensBoardTitle;
	
	private List<EnsembleTeam> teamList;
	private List<EnsembleBoardWantPart> wantPartList;
	
	}
