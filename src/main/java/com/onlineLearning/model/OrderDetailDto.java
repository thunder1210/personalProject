package com.onlineLearning.model;

public class OrderDetailDto {
	private Integer proId;
	private Integer buyingAmount;
//	private Integer	OrderId;
	private Integer singlePrice;
	private Integer totalPrice;


	public Integer getProId() {
		return proId;
	}
	public void setProId(Integer proId) {
		this.proId = proId;
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
