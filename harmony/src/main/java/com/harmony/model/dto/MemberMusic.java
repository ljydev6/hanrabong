package com.harmony.model.dto;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class MemberMusic {
	private String memNo;
	private String type;
	private String link;

}
