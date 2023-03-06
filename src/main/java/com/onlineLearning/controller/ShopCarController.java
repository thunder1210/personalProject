package com.onlineLearning.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.onlineLearning.model.Member;
import com.onlineLearning.model.Product;
import com.onlineLearning.model.ShopCar;
import com.onlineLearning.model.shoppingcarData;
import com.onlineLearning.service.MemberService;
import com.onlineLearning.service.ProductService;
import com.onlineLearning.service.ShopCarService;

@Controller
public class ShopCarController {

	@Autowired
	private ShopCarService shopcarService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private MemberService memberService;
	
	//http://localhost:8080/onlinelearning/shopCar/showCar
	// 從前端得到下單的會員 下單的數量 得到後存到購物車裡
	@ResponseBody
	@PostMapping("/shopCar/addToCar")
	public String addToCar(@RequestParam("memberId") Integer getMember,@RequestParam("productId") Integer getProduct, @RequestParam("num") Integer amount){
	
		boolean repeat = shopcarService.isRepeat(getMember, getProduct);
		if(repeat) {
			return "already exist";
		}
		Product chosenProduct =pService.findById(getProduct);
		Member chosenMember = memberService.findMemberById(getMember);
		
		ShopCar oneListOfShopCar = new ShopCar(amount,chosenMember,chosenProduct);
		shopcarService.create(oneListOfShopCar);
//		if((onStock - amount) < 0) {
//			System.out.println("庫存不足");			
//		}
		
		return "success";
	} 
////////////////////////跳轉到購物車的葉面////////////////////////
//	@ResponseBody
	@GetMapping("/shopCar/showMyCar")
	public String showMyCar(@RequestParam("memberId") Integer MemberId,Model model) {
		List<ShopCar> outcome = shopcarService.findBySelectedMemID(MemberId);
		for (ShopCar shopCar : outcome) {
			shopCar.setFkProductId(shopCar.getProduct().getProductId()); 
		}
//		Member member = memberService.findMemberById(MemberId);
//		List<ShopCar> list = member.getShoppingDetail();
		model.addAttribute("allShopCar",outcome);
		
		return "siao/shopCar/shopCarFront/shopCarForClient";
	}
///////////////////////到購物車管理頁面並列出所有的訂單////////////////////////	
	//http://localhost:8080/onlinelearning/productFront/selectedProduct?id=1
//	@ResponseBody
	@GetMapping("/shopCar/showCar")
	public String showAllCar(Model model){
				List<ShopCar> allCar = shopcarService.showAllCar();
				
		model.addAttribute("allShopCar", allCar);
		return "siao/shopCar/shopCarBack/shopCarManagement";
	}
	//// 刪除資料
	@DeleteMapping("/shopCar/delete")
	public String deleteCar(@RequestParam("id") Integer id) {
		shopcarService.deleteByCarId(id);
		return "redirect:/shopCar/showCar";
	}
	
	/////////////////////訂購完畢刪除購物車 
	@DeleteMapping(value ="/shopCar/axiosdelete", consumes = "application/json")
	@ResponseStatus(HttpStatus.CREATED)
	public void axiosdeleteCar(@RequestBody ArrayList<Integer> ids) {
	    for (Integer id : ids) {
	    	System.out.println("確認: "+id );
	        shopcarService.deleteByCarId(id);
	    }	
	   
	}
	
////////////////////////////////從客戶端刪除////////////////
	@DeleteMapping("/shopCar/deleteInClient")
	public String deleteCarInClient(@RequestParam("id") Integer id,@RequestParam("MemId") Integer MemId) {
//		List<ShopCar> outcome = shopcarService.findBySelectedMemID(MemId);
		System.out.print("刪除");
		
		shopcarService.deleteByCarId(id);
		return "redirect:/shopCar/showMyCar?memberId="+MemId;
	}
	//查詢資料By 會員id
	@GetMapping("/shopCar/searchByChoosedId")
	public String SearchByConditionId(@RequestParam("selectedValueIN")Integer selectedValue,@RequestParam("searchbarIN") Integer SearchId,Model model) {
		List<ShopCar> outcome = shopcarService.searchByCondition(selectedValue,SearchId);
		model.addAttribute("allShopCar", outcome);
		return "siao/shopCar/shopCarBack/shopCarManagement";
	}
//////////////////////////訂單管理///////////////////////////////
//	@ResponseBody
//	@GetMapping("/shopCar/searchByMemPayed")
//	public List<ShopCar> SearchByMemPayed(@RequestParam("MemberId") Integer MemberId) {
//		List<ShopCar> outcome = shopcarService.searchByMemPay(MemberId);
//		return outcome;
//	}
//	@ResponseBody
//	@GetMapping("/shopCar/searchByMemUnpayed")
//	public List<ShopCar> SearchByMemUnpayed(@RequestParam("MemberId") Integer MemberId) {
//		List<ShopCar> outcome = shopcarService.searchByMemUnpay(MemberId);
//		return outcome;
//	}
	@ResponseBody
	@PostMapping("/shopCar/jumpToCheck2")
	public void jumpToCheck2(@RequestBody Integer carId,@RequestBody Integer amount,Model model) {

		//		outcome = shopcarService.throwproduct(carId);
//		Iterator<shoppingcarData> out = outcome.iterator();
//		if(out.hasNext()) {
//			shoppingcarData shopData = out.next();
//			shopData.
//		}
//		model.addAttribute("selectedShopCar",outcome);
//		return outcome;
	}
	//////////////
	@ResponseBody
	@PostMapping("/shopCar/jumpToCheck1")
	public List<shoppingcarData>  jumpToCheck1(@RequestBody ArrayList<Integer> carId,Model model) {
		List<shoppingcarData> outcome = shopcarService.throwproduct(carId);
		model.addAttribute("selectedShopCar",outcome);
		return outcome;
	}
	
 	///不用response body
	@PostMapping("/shopCar/jumpToCheck")
	public String jumpToCheck(@RequestParam("carId") ArrayList<Integer> carId,Model model) {
		List<shoppingcarData> outcome = shopcarService.throwproduct(carId);
		model.addAttribute("selectedShopCar",outcome);
		return "siao/shopCar/shopCarFront/order";
	}
	
 	///不用response body
//	@PostMapping("/shopCar/jumpToCheck")
//	public String jumpToCheck() {
//		
//		return "siao/shopCar/shopCarFront/order";
//
//	}
	
	/////update 數量////
	@ResponseBody
	@PutMapping("/shopCar/updateAmount")
	public String updateAmount(@RequestBody ShopCar shopcar) {
		shopcarService.updateAmount(shopcar);
		return "更新成功";
	}
	
}
