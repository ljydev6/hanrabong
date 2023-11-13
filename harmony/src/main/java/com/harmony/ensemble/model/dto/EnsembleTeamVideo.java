package com.harmony.ensemble.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EnsembleTeamVideo {
	
	private int vNo;
	private String ensTeamNo;
	private String vType;
	private String vAddr;
	
}
