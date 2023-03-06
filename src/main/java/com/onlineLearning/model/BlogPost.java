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
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "blogPost")
public class BlogPost {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blogPostId")
	private Integer blogPostId;

	@Column(name = "blogPostTitle")
	private String blogPostTitle;

	@Column(name = "blogPostContent")
	private String blogPostContent;

	@Column(name = "blogPostType")
	private String blogPostType;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "blogPostDate")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date blogPostDate;

	@PrePersist
	public void onCreate() {
		if (blogPostDate == null) {
			blogPostDate = new Date();
		}
	}
	
	@Transient
	private MultipartFile blogPostMultipart;
	
	@Column(name = "blogPostPhoto", columnDefinition = "nvarchar(MAX)")
	private String blogPostPhoto;

	public BlogPost() {
	}
	
	@JsonBackReference
	@ManyToOne(targetEntity = Member.class)
	@JoinColumn(name = "FKmemberId")
	private Member member;
	
	@Transient
	private Integer memberId;

	public Integer getBlogPostId() {
		return blogPostId;
	}

	public void setBlogPostId(Integer blogPostId) {
		this.blogPostId = blogPostId;
	}

	public String getBlogPostTitle() {
		return blogPostTitle;
	}

	public void setBlogPostTitle(String blogPostTitle) {
		this.blogPostTitle = blogPostTitle;
	}

	public String getBlogPostContent() {
		return blogPostContent;
	}

	public void setBlogPostContent(String blogPostContent) {
		this.blogPostContent = blogPostContent;
	}

	public String getBlogPostType() {
		return blogPostType;
	}

	public void setBlogPostType(String blogPostType) {
		this.blogPostType = blogPostType;
	}

	public Date getBlogPostDate() {
		return blogPostDate;
	}

	public void setBlogPostDate(Date blogPostDate) {
		this.blogPostDate = blogPostDate;
	}

	public MultipartFile getBlogPostMultipart() {
		return blogPostMultipart;
	}

	public void setBlogPostMultipart(MultipartFile blogPostMultipart) {
		this.blogPostMultipart = blogPostMultipart;
	}

	public String getBlogPostPhoto() {
		return blogPostPhoto;
	}

	public void setBlogPostPhoto(String blogPostPhoto) {
		this.blogPostPhoto = blogPostPhoto;
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

	
	
}
