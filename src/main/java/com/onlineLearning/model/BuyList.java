package com.onlineLearning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="buylist")
public class BuyList {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="BuyListtId")
		private Integer buyListtId;
				
		@JsonBackReference(value = "shopcar")
		@ManyToOne
		@JoinColumn(name="FKShopCar")
		private ShopCar shopCar;
			
		@Column(name="Payed")
		private Integer payed ;

}
