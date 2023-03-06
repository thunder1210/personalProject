package com.onlineLearning.model;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "book")
public class Book implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BookId")
	private Integer bookid;

	@Column(name = "BookName", columnDefinition = "nvarchar(MAX)")
	private String bookName;

	@Column(name = "BookType", columnDefinition = "nvarchar(MAX)")
	private String bookType;

	@JsonManagedReference
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "book")
	private List<BookContent> contents = new LinkedList<BookContent>();

//	@JsonManagedReference //	主，把底下的大家變 JSON 字串
//	@JsonBackRefernce //	從，我抓回去對方不會變 JSON 字串
//	上面兩者要兩邊互相對應
	@JsonIgnore // 我不管，我就是不要把這個變 JSON 字串
	@Lob
	@Column(name = "BookPhoto")
	private byte[] bookPhoto;
	
	@OneToOne(mappedBy = "book")
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Book() {
	}

	public Integer getBookid() {
		return bookid;
	}

	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public List<BookContent> getContents() {
		return contents;
	}

	public void setContents(List<BookContent> contents) {
		this.contents = contents;
	}

	public byte[] getBookPhoto() {
		return bookPhoto;
	}

	public void setBookPhoto(byte[] bookPhoto) {
		this.bookPhoto = bookPhoto;
	}

}
