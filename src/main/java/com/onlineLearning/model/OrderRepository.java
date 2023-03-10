package com.onlineLearning.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderRepository extends JpaRepository<Order, Integer>{
	@Query(value="select TOP 1 * from orderform ORDER BY OrderTime DESC",nativeQuery = true)
	Order findTheLatest();
	
}
