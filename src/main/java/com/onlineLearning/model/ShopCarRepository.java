package com.onlineLearning.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ShopCarRepository extends JpaRepository<ShopCar, Integer> {

//	@Query(value="select * from shoppingcart s where" + " s."+":searchBySelected = :Id",nativeQuery = true)
//	List<ShopCar> findBySelectedID(@Param("searchBySelected") String selected,@Param("Id") Integer Id);
	@Query(value="select * from shoppingcart s where s.FKProductId = :Id",nativeQuery = true)
	List<ShopCar> findBySelectedProID(@Param("Id") Integer Id);
	
	@Query(value="select * from shoppingcart s where s.FKMemberId = :Id",nativeQuery = true)
	List<ShopCar> findBySelectedMemID(@Param("Id") Integer Id);
	
	//
	@Query(value="select * from shoppingcart s where s.FKMemberId = :Id And Payed = 1",nativeQuery = true)
	List<ShopCar> findByMemPay(@Param("Id") Integer Id);
	
	//更新顧客的產品數量
	@Transactional
	@Modifying
	@Query(value="update shoppingcart set ShoppingCartAmount =:productamount where ShoppingCartId=:Id" ,nativeQuery = true, countProjection = "ShopCar")
	void updateCarAmount(@Param("Id") Integer Id,@Param("productamount") Integer productamount);
	
	
	@Query(value="select * from shoppingcart s where s.FKMemberId =:MemberId and s.FKProductId=:ProductId",nativeQuery = true)
	List<ShopCar> isExist(@Param("MemberId") Integer memberId,@Param("ProductId") Integer productId);

	 @Query(value = "SELECT ShoppingCartId, member.MemberId ,product.ProductId , product.ProductName, product.ProductPhoto, ShoppingCartAmount, product.ProductAmount, product.ProductPrice  FROM shoppingcart inner join member on member.MemberId = shoppingcart.FKMemberId inner join product on ProductId = shoppingcart.FKProductId where ShoppingCartId = :shoppingCarId",nativeQuery = true)
	 shoppingcarData findCar(@Param("shoppingCarId") Integer shoppingcarid);
}