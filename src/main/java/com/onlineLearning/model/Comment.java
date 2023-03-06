package com.onlineLearning.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "comment")
public class Comment {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CommentId")
	private Integer commentId;
	
	@Column(name = "CommentTitle",columnDefinition="nvarchar(MAX)")
	private String commentTitle;
	
	@Column(name = "CommentType",columnDefinition="nvarchar(MAX)")
	private String commentType;
	
	@Column(name = "CommentPhoto",columnDefinition="nvarchar(MAX)")
	private String commentPhoto;
	
//	@Column(name = "CommentDate")
//	private String commentDate;
	
	@Temporal(TemporalType.TIMESTAMP) 
	@Column(name="CommentDate",columnDefinition="datetime2(7)")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	private Date commentDate;
	
	@PrePersist
	public void onCreate() {
		if(commentDate == null) {
			commentDate = new Date();
		}
		}

	

	@Column(name = "ProductId")
	private String productId;
	
	public Comment(Integer commentId, String commentTitle, String commentType, String commentPhoto, Date commentDate,
			String productId) {
		super();
		this.commentId = commentId;
		this.commentTitle = commentTitle;
		this.commentType = commentType;
		this.commentPhoto = commentPhoto;
		this.commentDate = commentDate;
		this.productId = productId;
	}


	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}


	public Integer getCommentId() {
		return commentId;
	}


	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}


	public String getCommentTitle() {
		return commentTitle;
	}

	
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}


	public String getCommentType() {
		return commentType;
	}


	public void setCommentType(String commentType) {
		this.commentType = commentType;
	}


	public String getCommentPhoto() {
		return commentPhoto;
	}


	public void setCommentPhoto(String commentPhoto) {
		this.commentPhoto = commentPhoto;
	}


	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	

}
