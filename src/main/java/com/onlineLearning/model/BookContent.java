package com.onlineLearning.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "bookContent")
public class BookContent {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BookContentId")
	private Integer bookContentId;
	
	@Column(name = "BookChapter",columnDefinition = "nvarchar(MAX)")
	private String bookChapter;
	
	@Column(name = "Content",columnDefinition = "nvarchar(MAX)")
	private String content;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Date")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss EEEE", timezone = "GMT+8")
	private Date bookDate;
	
	@PrePersist
	public void onCreate() {
		if(bookDate == null) {
			bookDate = new Date();
		}
	}
	
//	避免序列化 Json 本屬性
	@JsonIgnore
	@Lob
	@Column(name = "BookContentPhoto")
	private byte[] bookContentPhoto;
	
//	不由這邊序列化
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "Book_FK")
	private Book book;

	public BookContent() {
	}

	public Integer getBookContentId() {
		return bookContentId;
	}

	public void setBookContentId(Integer bookContentId) {
		this.bookContentId = bookContentId;
	}

	public String getBookChapter() {
		return bookChapter;
	}

	public void setBookChapter(String bookChapter) {
		this.bookChapter = bookChapter;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public byte[] getBookContentPhoto() {
		return bookContentPhoto;
	}

	public void setBookContentPhoto(byte[] bookContentPhoto) {
		this.bookContentPhoto = bookContentPhoto;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

}
