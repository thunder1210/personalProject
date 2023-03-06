package com.onlineLearning.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	
	@Query(value = "select * from Product p where p.ProductName like %:keyword% or p.ProductCreater like %:keyword% or p.ProductPublisher like %:keyword%", nativeQuery = true)
	 List<Product> findByKeyword(@Param("keyword") String keyword);
	
	@Query(value = "select * from Product p where p.ProductName like %?1% or p.ProductPublisher like %?2% ", nativeQuery = true)
	List<Product> conditionSearch(String name,String Publisher);
	
	@Query(value = "select * from Product p where p.OnSelve ='1'", nativeQuery = true)
	Page<Product> onSelve(Pageable pageable);
	
//	@Query(value = "Select * from (Member left join shoppingcart on (FKMemberId = memberId)) left join Product on ProductId = FKProductId where memberId = '11'", nativeQuery = true)
//	public List<Object> shoppingCarProductFromMember();
		
	
}
   