package com.onlineLearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.onlineLearning.model.Order;
import com.onlineLearning.model.OrderDto;
import com.onlineLearning.service.OrderService;

//http://localhost:8080/onlinelearning/product/productlist
@Controller
public class OrderController {
	
	
	@Autowired
	private OrderService orderService;

	
	@GetMapping("/order/showOrder")
	public String SearchByConditionId(@RequestParam("selectedValueIN")Integer selectedValue,@RequestParam("searchbarIN") Integer SearchId,Model model) {
		List<Order> outcome = orderService.showAllOrder();
		model.addAttribute("allOrder", outcome);
		return "siao/shopCar/shopCarBack/shopCarManagement";
	}
	@PostMapping(value = "/order/addOrder", consumes = "application/json")
	@ResponseStatus(HttpStatus.CREATED)
	public void AddOrder(@RequestBody OrderDto order ) {
		System.out.println(order.getPayed());
		Order saved = new Order(order.getPayed(),order.getTotalPrice(),order.getMemberId());
		orderService.create(saved);
	}
}
