package com.onlineLearning.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "memberexperience")
public class MemberExperience {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FeedbackId", columnDefinition = "int")
	private Integer feedbackId;
	
	@Column(name = "StarCounts", columnDefinition = "int")
	private Integer starCounts;
	
	@Column(name = "FeedbackContent", columnDefinition = "nvarchar(500)")
	private String feedbackContent;
	
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "FeedbackTime", columnDefinition = "smalldatetime")
	private Timestamp feedbackTime;
	
	@Transient
	private Integer memberid;
	
	@JsonBackReference
	@ManyToOne(targetEntity = Member.class)
	@JoinColumn(name = "FKmemberId")
	private Member member;

	public MemberExperience() {
		
	}

	public Integer getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getFeedbackContent() {
		return feedbackContent;
	}
	
	public Integer getStarCounts() {
		return starCounts;
	}

	public void setStarCounts(Integer starCounts) {
		this.starCounts = starCounts;
	}

	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}

	public Timestamp getFeedbackTime() {
		return feedbackTime;
	}

	public void setFeedbackTime(Timestamp feedbackTime) {
		this.feedbackTime = feedbackTime;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}
}
