package com.harmony.ensemble.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EnsembleBoardApply {

	private String ensPartIndex;
	private String ensMembeNo;
	private String ensApproval;
}
