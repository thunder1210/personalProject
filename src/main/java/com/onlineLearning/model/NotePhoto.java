package com.onlineLearning.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "notePhoto")
public class NotePhoto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "NotePhotoId", columnDefinition = "int")
	private Integer notePhotoId;

	@Column(name = "NotePhotoContent", columnDefinition = "nvarchar(MAX)")
	private String notePhotoContent;

	@Temporal(TemporalType.TIMESTAMP) // 如果用 sql.date, 這行不用寫
	@Column(name = "NotePhotoUploadTime", columnDefinition = "datetime")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date notePhotoUploadTime;

	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "FKNoteId", columnDefinition = "int")
	private Note note;

	@PrePersist // 當物件轉換成 Persistent 狀態時，先做這件事
	private void onCreate() {
		if (notePhotoUploadTime == null) {
			notePhotoUploadTime = new Date();
		}
	}

	public NotePhoto() {

	}

	public NotePhoto(Integer notePhotoId, String notePhotoContent, Date notePhotoUploadTime, Note note) {
		super();
		this.notePhotoId = notePhotoId;
		this.notePhotoContent = notePhotoContent;
		this.notePhotoUploadTime = notePhotoUploadTime;
		this.note = note;
	}

	public Integer getNotePhotoId() {
		return notePhotoId;
	}

	public void setNotePhotoId(Integer notePhotoId) {
		this.notePhotoId = notePhotoId;
	}

	public String getNotePhotoContent() {
		return notePhotoContent;
	}

	public void setNotePhotoContent(String notePhotoContent) {
		this.notePhotoContent = notePhotoContent;
	}

	public Date getNotePhotoUploadTime() {
		return notePhotoUploadTime;
	}

	public void setNotePhotoUploadTime(Date notePhotoUploadTime) {
		this.notePhotoUploadTime = notePhotoUploadTime;
	}

	public Note getNote() {
		return note;
	}

	public void setNote(Note note) {
		this.note = note;
	}

}
