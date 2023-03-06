package com.onlineLearning.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="orderDetail")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="OrderDetailId")
	private Integer orderDetailId;
	
	@Column(name="Payment")
	private String payment;
	
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name="FKProductId")
	private Product product;
	
	@Column(name="FKorderId")
	private Integer orderId;
	
	@Column(name="BuyingAmount")
	private Integer buyingAmount;
	
	@Column(name="SinglePrice")
	private Integer singlePrice;
	
	@Column(name="TotalPrice")//合計
	private Integer totalPrice;




	public OrderDetail(Product product, Integer orderId, Integer buyingAmount, Integer singlePrice,
			Integer totalPrice) {
		super();
		this.product = product;
		this.orderId = orderId;
		this.buyingAmount = buyingAmount;
		this.singlePrice = singlePrice;
		this.totalPrice = totalPrice;
	}

	public OrderDetail() {
		super();
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}



	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}



	public Integer getOrderId() {
		return orderId;
	}


	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public Integer getOrderDetailId() {
		return orderDetailId;
	}


	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}


	public Integer getBuyingAmount() {
		return buyingAmount;
	}


	public void setBuyingAmount(Integer buyingAmount) {
		this.buyingAmount = buyingAmount;
	}


	public Integer getSinglePrice() {
		return singlePrice;
	}


	public void setSinglePrice(Integer singlePrice) {
		this.singlePrice = singlePrice;
	}


	public Integer getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
