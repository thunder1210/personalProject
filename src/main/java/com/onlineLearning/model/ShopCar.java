package com.onlineLearning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="shoppingcart")
public class ShopCar {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ShoppingCartId")
	private Integer shoppingCartId;
	
	@Column(name="ShoppingCartAmount")
	private Integer shoppingCartAmount;
	
	@JsonBackReference(value = "shopcar")
	@ManyToOne
	@JoinColumn(name="FKMemberId")
	private Member member;
	
	@JsonBackReference(value = "prod")
	@ManyToOne
	@JoinColumn(name="FKProductId")
	private Product product;
	
	@Transient
	private Integer fkProductId;
	
	@Transient
	private String productPhoto;
	
	@Transient
	private String ProductPrice;
	
	public ShopCar(Integer shoppingCartAmount, Member member, Product product) {
		super();
		this.shoppingCartAmount = shoppingCartAmount;
		this.member = member;
		this.product = product;
	}

	public ShopCar() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ShopCar(Integer shoppingCartId, Integer shoppingCartAmount, Member member, Product product,
			Integer fkProductId) {
		super();
		this.shoppingCartId = shoppingCartId;
		this.shoppingCartAmount = shoppingCartAmount;
		this.member = member;
		this.product = product;
		this.fkProductId = fkProductId;
	}

	public Integer getShoppingCartId() {
		return shoppingCartId;
	}

	public void setShoppingCartId(Integer shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}

	public Integer getShoppingCartAmount() {
		return shoppingCartAmount;
	}

	public void setShoppingCartAmount(Integer shoppingCartAmount) {
		this.shoppingCartAmount = shoppingCartAmount;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getfkProductId() {
		return fkProductId;
	}

	public void setfkProductId(Integer fkProductId) {
		this.fkProductId = fkProductId;
	}



	

	
	
}
