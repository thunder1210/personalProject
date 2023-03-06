package com.onlineLearning.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "note")
public class Note {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "NoteId", columnDefinition="int")
	private Integer noteId;
	
	@Column(name = "NoteTitle", columnDefinition="nvarchar(100)")
	private String noteTitle;
	
	@Column(name = "NoteContent", columnDefinition="nvarchar(MAX)")
	private String noteContent;
	
	@Column(name = "NoteTopSetting", columnDefinition="nvarchar(30)")
	private String noteTopSetting;
	
	@Column(name = "NoteAccess", columnDefinition="nvarchar(30)")
	private String noteAccess;
	
	@Temporal(TemporalType.TIMESTAMP) //如果用 sql.date, 這行不用寫
	@Column(name="NoteCreateTime", columnDefinition="datetime")
	@DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date noteCreateTime;
	
	@Temporal(TemporalType.TIMESTAMP) //如果用 sql.date, 這行不用寫
	@Column(name="NoteLastUpdateTime", columnDefinition="datetime")
	@DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date noteLastUpdateTime;
	
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "FKMemberId", columnDefinition="int")
	private Member member;
	
	@Transient
	private Integer memberId;
	
	@JsonManagedReference
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "note")
	private List<NotePhoto> notePhotoList = new ArrayList<>();
	
	@PrePersist // 當物件轉換成 Persistent 狀態時，先做這件事
	private void onCreate() {
		if (noteCreateTime == null) {
			noteCreateTime = new Date();
		}
		if (noteLastUpdateTime == null) {
			noteLastUpdateTime = new Date();
		}
	}
	
	public Note() {

	}

	public Note(Integer noteId, String noteTitle, String noteContent, String noteTopSetting, String noteAccess,
			Date noteCreateTime, Date noteLastUpdateTime, Member member, Integer memberId,
			List<NotePhoto> notePhotoList) {
		super();
		this.noteId = noteId;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.noteTopSetting = noteTopSetting;
		this.noteAccess = noteAccess;
		this.noteCreateTime = noteCreateTime;
		this.noteLastUpdateTime = noteLastUpdateTime;
		this.member = member;
		this.memberId = memberId;
		this.notePhotoList = notePhotoList;
	}

	public Integer getNoteId() {
		return noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}

	public String getNoteTitle() {
		return noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public String getNoteTopSetting() {
		return noteTopSetting;
	}

	public void setNoteTopSetting(String noteTopSetting) {
		this.noteTopSetting = noteTopSetting;
	}

	public String getNoteAccess() {
		return noteAccess;
	}

	public void setNoteAccess(String noteAccess) {
		this.noteAccess = noteAccess;
	}

	public Date getNoteCreateTime() {
		return noteCreateTime;
	}

	public void setNoteCreateTime(Date noteCreateTime) {
		this.noteCreateTime = noteCreateTime;
	}

	public Date getNoteLastUpdateTime() {
		return noteLastUpdateTime;
	}

	public void setNoteLastUpdateTime(Date noteLastUpdateTime) {
		this.noteLastUpdateTime = noteLastUpdateTime;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public List<NotePhoto> getNotePhotoList() {
		return notePhotoList;
	}

	public void setNotePhotoList(List<NotePhoto> notePhotoList) {
		this.notePhotoList = notePhotoList;
	}

	

	
	
	
	

}
