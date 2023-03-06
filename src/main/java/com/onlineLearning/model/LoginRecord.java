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

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "loginrecord")
public class LoginRecord {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RecordId")
	private Integer recordId;

	@Column(name = "LoginTime", columnDefinition = "smalldatetime")
	private Timestamp loginTime;

	@Column(name = "LoginIP", columnDefinition = "nvarchar(20)")
	private String loginIP;

	@Column(name = "LoginLocation", columnDefinition = "nvarchar(50)")
	private String loginLocation;

	@Column(name = "LoginStatus", columnDefinition = "nvarchar(20)")
	private String loginStatus;

	@Column(name = "LoginType", columnDefinition = "nvarchar(20)")
	private String loginType;

	@Column(name = "SystemEvent", columnDefinition = "nvarchar(50)")
	private String systemEvent;

	@JsonBackReference
	@ManyToOne(targetEntity = Member.class)
	@JoinColumn(name = "FKmemberId")
	private Member member;

	public LoginRecord() {

	}

	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public Timestamp getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	public String getLoginIP() {
		return loginIP;
	}

	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}

	public String getLoginLocation() {
		return loginLocation;
	}

	public void setLoginLocation(String loginLocation) {
		this.loginLocation = loginLocation;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getSystemEvent() {
		return systemEvent;
	}

	public void setSystemEvent(String systemEvent) {
		this.systemEvent = systemEvent;
	}
}