package com.onlineLearning.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name = "product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ProductId")
	private Integer productId;

	@Column(name = "ProductName",columnDefinition="nvarchar(MAX)")
	private String productName;
	
	@Column(name = "ProductPrice",columnDefinition="nvarchar(MAX)")
	private String productPrice;
	
	@Column(name = "ProductPhoto",columnDefinition="nvarchar(MAX)")
	private String productPhoto;
	
	@Column(name = "ProductType",columnDefinition="nvarchar(MAX)")
	private String productType;
	
	@Column(name = "ProductAmount",columnDefinition="nvarchar(MAX)")
	private String productAmount;
	
	@Column(name = "ProductCreater",columnDefinition="nvarchar(MAX)")
	private String productCreater;
	
	@Column(name = "ProductPublisher",columnDefinition="nvarchar(MAX)")
	private String productPublisher;
	
	@Column(name = "ProductDate",columnDefinition="nvarchar(MAX)")
	private String productDate;
	
	@JsonManagedReference(value = "prod")
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "product")//mappedBY 的 元素是對到ManyToOne 所設的java 元素
	private List<ShopCar> shopCar = new ArrayList<>();
	
	@Column(name="ProductIntro",columnDefinition="nvarchar(MAX)")
	private String productIntro;
	
	
	@Column(name ="AuthorIntro",columnDefinition="nvarchar(MAX)")
	private String authorIntro;
	
	@Column(name ="OnSelve",columnDefinition="nvarchar(MAX)")
	private String onSelve;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FKCourseId")
	private Course course;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FKBookId")
	private Book book;
	
	public Product() {
	
	}
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Product(String productName, String productPrice, String productPhoto, String productType,
			String productAmount, String productCreater, String productPublisher, String productDate, String productSelve) {
		super();
		this.productName = productName;
		this.productPrice = productPrice;
		this.productPhoto = productPhoto;
		this.productType = productType;
		this.productAmount = productAmount;
		this.productCreater = productCreater;
		this.productPublisher = productPublisher;
		this.productDate = productDate;
		this.onSelve=productSelve;
	}

	public String getOnSelve() {
		return onSelve;
	}

	public void setOnSelve(String onSelve) {
		this.onSelve = onSelve;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(String productAmount) {
		this.productAmount = productAmount;
	}

	public String getProductCreater() {
		return productCreater;
	}

	public void setProductCreater(String productCreater) {
		this.productCreater = productCreater;
	}

	public String getProductPublisher() {
		return productPublisher;
	}

	public void setProductPublisher(String productPublisher) {
		this.productPublisher = productPublisher;
	}

	public String getProductDate() {
		return productDate;
	}

	public void setProductDate(String productDate) {
		this.productDate = productDate;
	}

	public List<ShopCar> getShopCar() {
		return shopCar;
	}

	public void setShopCar(List<ShopCar> shopCar) {
		this.shopCar = shopCar;
	}

	public String getProductIntro() {
		return productIntro;
	}

	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}

	public String getAuthorIntro() {
		return authorIntro;
	}

	public void setAuthorIntro(String authorIntro) {
		this.authorIntro = authorIntro;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
	
	
}
