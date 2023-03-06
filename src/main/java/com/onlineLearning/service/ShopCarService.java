package com.onlineLearning.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlineLearning.model.ShopCar;
import com.onlineLearning.model.ShopCarRepository;
import com.onlineLearning.model.shoppingcarData;

@Service
@Transactional
public class ShopCarService {
	@Autowired
	private ShopCarRepository ShopCarDao;

	// 當下簞時 庫存數量也要變
	public void create(ShopCar shopcar) {
		ShopCarDao.save(shopcar);
	}

	// 藉由memberID 去找shopCarId
	public boolean isRepeat(Integer memberId, Integer productId) {
		List<ShopCar> outcome = ShopCarDao.isExist(memberId, productId);
		if (outcome.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	// 展示所有的購物單
	public List<ShopCar> showAllCar() {
		return ShopCarDao.findAll();
	}

	// 刪除所選擇的購物單
	public void deleteByCarId(@RequestParam("id") Integer id) {
		ShopCarDao.deleteById(id);
	}

	// 由會員id找出購物車
	public List<ShopCar> searchByCondition(Integer searchBySelected, Integer memid) {
		if (searchBySelected == 1) {
			System.out.println("searchBySelected是一");
			return ShopCarDao.findBySelectedMemID(memid);
		} else {
			return ShopCarDao.findBySelectedProID(memid);
		}
	}

	// 找出會員的購物車
	public List<ShopCar> findBySelectedMemID(Integer memid) {
		return ShopCarDao.findBySelectedMemID(memid);
	}

//	//找出會員id 與已付款的資訊
//	public List<ShopCar> searchByMemPay(Integer memid){
//			return ShopCarDao.findByMemPay(memid);
//	}
//	//找出會員id 
//	public List<ShopCar> searchByMemUnpay(Integer memid){
//			return ShopCarDao.findByMemUnPay(memid);
//	}
	public List<shoppingcarData> throwproduct(ArrayList<Integer> whatCustomerChoose) {
		if (whatCustomerChoose.isEmpty()) {
			return null;
		} else {
			List<shoppingcarData> outcome = new ArrayList<shoppingcarData>();
			Iterator<Integer> Iter = whatCustomerChoose.iterator();
			while (Iter.hasNext()) {
				outcome.add(ShopCarDao.findCar(Iter.next()));
			}
			return outcome;
		}

	}
	public void updateAmount(ShopCar shopcar) {
		ShopCarDao.updateCarAmount(shopcar.getShoppingCartId(),shopcar.getShoppingCartAmount()) ;
	}
	
//	public List<ShopCar> modifyTheNumCustomerWantToBuy(ArrayList<Integer> getShopCarId,ArrayList<Integer> ModifyTheNum){
//		if (getShopCarId.isEmpty()) {
//			return null;
//		} else {
//			List<ShopCar> outcome = new ArrayList<ShopCar>();
//			Iterator<Integer> Iter = getShopCarId.iterator();
//			while (Iter.hasNext()) {
//				outcome.add(ShopCarDao.giveBackCar(Iter.next()));
//			}
//			return outcome;
//		}
//
//	}
}
