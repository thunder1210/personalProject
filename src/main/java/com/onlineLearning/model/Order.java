package com.onlineLearning.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="orderform")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="OrderId")
	private Integer orderId;
	
	@Temporal(TemporalType.TIMESTAMP) // 如果用 sql.Date, 這行不用寫
	@Column(name="OrderTime")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss EEEE", timezone = "GMT+8")
	private Date orderTime;

	@Column(name="Payed",columnDefinition="nvarchar(MAX)")
	private String payed;

	@Column(name="ShippingStatement",columnDefinition="nvarchar(MAX)")
	private String shippingStatement;

	@Column(name="TotalPrice",columnDefinition="nvarchar(MAX)")
	private String totalPrice;
	
	@Column(name="MemId",columnDefinition="nvarchar(MAX)")
	private Integer memId;

//	
//	@JsonManagedReference
//	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "order")
//	private List<OrderDetail> orderDetail = new ArrayList<>();
	
	@PrePersist // 當物件轉換成 Persistent 狀態，先做這件事
	public void onCreate() {
		if(orderTime == null) {
			orderTime = new Date();
		}  
	}

	public Order(String payed, String totalPrice, Integer memId) {
		super();
		this.payed = payed;
		this.totalPrice = totalPrice;
		this.memId = memId;
	}

	public Order() {
		super();
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

//	public List<OrderDetail> getOrderDetail() {
//		return orderDetail;
//	}
//
//	public void setOrderDetail(List<OrderDetail> orderDetail) {
//		this.orderDetail = orderDetail;
//	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getPayed() {
		return payed;
	}

	public void setPayed(String payed) {
		this.payed = payed;
	}

	public String getShippingStatement() {
		return shippingStatement;
	}

	public void setShippingStatement(String shippingStatement) {
		this.shippingStatement = shippingStatement;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

//	public Integer getMemberId() {
//		return memberId;
//	}
//
//	public void setMemberId(Integer memberId) {
//		this.memberId = memberId;
//	}
}
