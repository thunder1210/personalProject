package com.onlineLearning.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineLearning.model.Order;
import com.onlineLearning.model.OrderRepository;
import com.onlineLearning.model.Product;
import com.onlineLearning.model.ShopCar;

@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderRepository OrderDao;
	
	
	
	//
	public void create(Order order) {
		OrderDao.save(order);
	}
	
	public List<Order> showAllOrder() {
		return OrderDao.findAll();
	}
	public Order findById(Integer id) {
		Optional<Order> optional = OrderDao.findById(id);

		if (optional.isPresent()) {
			Order order = optional.get();
			return order;
		}
		System.out.println("沒找到id 為" + id + "的資料");
		return null;
	}
	public Integer getLatest() {
		Order order = new Order();
		order=OrderDao.findTheLatest();
		return (order.getOrderId());
	}
}
