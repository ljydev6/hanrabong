package com.harmony.model.dto;

import java.sql.Date;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class MemberCareer {
	private String memNo;
	private String careerNo;
	private Date careerStart;
	private Date careerEnd;
	private String careerNote;
}
