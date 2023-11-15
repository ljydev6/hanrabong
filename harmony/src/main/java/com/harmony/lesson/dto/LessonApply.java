package com.harmony.lesson.dto;
import java.sql.Timestamp;
import java.util.Date;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LessonApply {
	private int applyNo;
	private int boardNo;
	private String memNo;
	private String applyPlace;
	private int applyNumberOfTimes;
	private Date applyDate;
	private char applyAccept;
	private Timestamp lessonStartTime;
	private Timestamp lessonEndTime;
	private String[] lessonDay;
}
