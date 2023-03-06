package com.onlineLearning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "exam")
public class Exam {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ExamId")
	private Integer examId;

	@Column(name = "ExamTitle")
	private String examTitle;

	@Column(name = "ExamType")
	private String examType;

	@Column(name = "ExamPhoto")
	private String examPhoto;

	@Column(name = "ExamContent")
	private String examContent;

	@Column(name = "ExamAnswer")
	private String examAnswer;

	public Exam() {
	}

	public Exam(Integer examId, String examTitle, String examType, String examPhoto, String examContent,
			String examAnswer) {
		super();
		this.examId = examId;
		this.examTitle = examTitle;
		this.examType = examType;
		this.examPhoto = examPhoto;
		this.examContent = examContent;
		this.examAnswer = examAnswer;
	}

	public Integer getExamId() {
		return examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	public String getExamTitle() {
		return examTitle;
	}

	public void setExamTitle(String examTitle) {
		this.examTitle = examTitle;
	}

	public String getExamType() {
		return examType;
	}

	public void setExamType(String examType) {
		this.examType = examType;
	}

	public String getExamPhoto() {
		return examPhoto;
	}

	public void setExamPhoto(String examPhoto) {
		this.examPhoto = examPhoto;
	}

	public String getExamContent() {
		return examContent;
	}

	public void setExamContent(String examContent) {
		this.examContent = examContent;
	}

	public String getExamAnswer() {
		return examAnswer;
	}

	public void setExamAnswer(String examAnswer) {
		this.examAnswer = examAnswer;
	}

}
