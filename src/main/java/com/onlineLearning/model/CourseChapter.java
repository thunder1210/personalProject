package com.onlineLearning.model;

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
@Table(name = "courseChapter")
public class CourseChapter {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourseChapterId")
	private Integer courseChapterId;

	@Column(name = "CourseChapter", columnDefinition = "nvarchar(MAX)")
	private String courseChapter;

	@Column(name = "CourseContent", columnDefinition = "nvarchar(MAX)")
	private String courseContent;

	@Column(name = "VideoOrNot", columnDefinition = "nvarchar(MAX)")
	private String videoOrNot;

	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "FKCourseId")
	private Course course;

	public CourseChapter() {
	}

	public Integer getCourseChapterId() {
		return courseChapterId;
	}

	public void setCourseChapterId(Integer courseChapterId) {
		this.courseChapterId = courseChapterId;
	}

	public String getCourseChapter() {
		return courseChapter;
	}

	public void setCourseChapter(String courseChapter) {
		this.courseChapter = courseChapter;
	}

	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	public String getVideoOrNot() {
		return videoOrNot;
	}

	public void setVideoOrNot(String videoOrNot) {
		this.videoOrNot = videoOrNot;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public CourseChapter(Integer courseChapterId, String courseChapter, String courseContent, String videoOrNot,
			Course course) {
		super();
		this.courseChapterId = courseChapterId;
		this.courseChapter = courseChapter;
		this.courseContent = courseContent;
		this.videoOrNot = videoOrNot;
		this.course = course;
	}

}
