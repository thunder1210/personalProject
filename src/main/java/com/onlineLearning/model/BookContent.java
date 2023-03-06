package com.onlineLearning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "bookContent")
public class BookContent {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BookContentId")
	private Integer bookContentId;
	
	@Column(name = "Bookchapter",columnDefinition = "nvarchar(MAX)")
	private String bookchapter;
	
	@Column(name = "BookContent",columnDefinition = "nvarchar(MAX)")
	private String bookContent;
	
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

	public String getBookchapter() {
		return bookchapter;
	}

	public void setBookchapter(String bookchapter) {
		this.bookchapter = bookchapter;
	}

	public String getBookContent() {
		return bookContent;
	}

	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
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
