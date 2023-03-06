package com.onlineLearning.controller;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.onlineLearning.model.OrderDetail;
import com.onlineLearning.model.OrderDetailDto;
import com.onlineLearning.model.Product;
import com.onlineLearning.service.OrderDetailService;
import com.onlineLearning.service.OrderService;
import com.onlineLearning.service.ProductService;
@Controller
public class OrderDetailController {

	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService pService;
	
	@PostMapping(value = "/orderDetail/addOrderDetail", consumes = "application/json")
	@ResponseStatus(HttpStatus.CREATED)
	public void AddOrderDetail(@RequestBody ArrayList<OrderDetailDto> order ) {
		Integer orderId = orderService.getLatest();
//		OrderDetail detail = new OrderDetail();
		Iterator<OrderDetailDto> Iter = order.iterator();
		while(Iter.hasNext()) {
			OrderDetailDto dto = Iter.next();
		       System.out.println("ProId: " + dto.getProId());
		        System.out.println("buyingAmount: " + dto.getBuyingAmount());
		        System.out.println("totalPrice: " + dto.getTotalPrice());
		        System.out.println("singlePrice: " + dto.getSinglePrice());
			Product thatProduct = new Product();
			thatProduct=pService.findById(dto.getProId());
			OrderDetail detail = new OrderDetail(thatProduct,orderId,dto.getBuyingAmount(),dto.getSinglePrice(),dto.getTotalPrice());
			orderDetailService.create(detail);
		}
	}
}
