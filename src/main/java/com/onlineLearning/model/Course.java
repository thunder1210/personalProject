package com.onlineLearning.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "course")
public class Course {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourseId")
	private Integer courseId;

	@Column(name = "CourseName", columnDefinition = "nvarchar(MAX)")
	private String courseName;

	@Column(name = "CourseType", columnDefinition = "nvarchar(MAX)")
	private String courseType;

	@Column(name = "CoursePicture", columnDefinition = "nvarchar(MAX)")
	private String coursePicture;

	@JsonManagedReference
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "course")
	private List<CourseChapter> courseChapter = new ArrayList<>();
	
	@OneToOne(mappedBy = "course")
	private Product product;

	public Course() {
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCoursePicture() {
		return coursePicture;
	}

	public void setCoursePicture(String coursePicture) {
		this.coursePicture = coursePicture;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public List<CourseChapter> getCourseChapter() {
		return courseChapter;
	}

	public void setCourseChapter(List<CourseChapter> courseChapter) {
		this.courseChapter = courseChapter;
	}

	public Course(Integer courseId, String courseName, String courseType, String coursePicture,
			List<CourseChapter> courseChapter) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseType = courseType;
		this.coursePicture = coursePicture;
		this.courseChapter = courseChapter;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}


}
