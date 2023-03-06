package com.onlineLearning.model;

import java.sql.Timestamp;

public interface MemberExperienceData {
	
	Integer getFeedBackId();
	
	String getFeedbackContent();
	
	Timestamp getFeedbackTime();
	
	Integer getStarCounts();
	
	Integer getFKmemberId();
	
	String getMemberPhoto();
	
	String getMemberName();
}
