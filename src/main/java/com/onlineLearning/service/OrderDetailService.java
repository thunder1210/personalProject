package com.onlineLearning.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineLearning.model.OrderDetail;
import com.onlineLearning.model.OrderDetailRepository;

@Service
@Transactional
public class OrderDetailService {
	@Autowired
	private OrderDetailRepository OrderDetailDao;
	
	//
	public void create(OrderDetail orderDetail) {
		OrderDetailDao.save(orderDetail);
	}
	
}
