package com.onlineLearning.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlineLearning.model.Course;
import com.onlineLearning.model.Product;
import com.onlineLearning.service.CourseService;
import com.onlineLearning.service.ProductService;
//http://localhost:8080/onlinelearning/product/productlist
//http://localhost:8080/onlinelearning/product/productshow

//過去給jsp的都是小寫
@Controller
public class ProductController {

	@Autowired
	private ProductService pService;
	
	@Autowired
	private CourseService cService;

	// 到商品展示頁面 並全部展示
	@GetMapping("/product/productshow")
	public String Prodshow(Model model) {

		List<Product> allProducts = pService.findAllProd();
		
		model.addAttribute("allProducts", allProducts);
		return "siao/product/productClientSide/product";
	}

	// 到商品管理頁面 並全部展示
	@GetMapping("/product/productlist")
	public String addProd(Model model) {

		List<Product> allProducts = pService.findAllProd();
		model.addAttribute("allProducts", allProducts);
		return "siao/product/productManagement/pCRUD";
	}

	// 跑到創造的頁面
	@GetMapping("/product/productcreate")
	public String goToCreate() {
		return "siao/product/productManagement/pCreateTemplate";
	}

	// 新增資料
	@PostMapping("/products/postadd")
	public String addProd(@RequestParam("productName") String productName,
			@RequestParam("productPrice") String productPrice, @RequestParam("productAmount") String productAmount,
			@RequestParam("productType") String productType, @RequestParam("productCreater") String productCreater,
			@RequestParam("productPublisher") String productPublisher, @RequestParam("productDate") String productDate,
			@RequestParam("productPhoto") MultipartFile file, @RequestParam("productSelve") String productSelve) {

		String productPhoto = "a";
		try {
			productPhoto = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(file.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 把空白的送回去:代表送成功
		Product newProd = new Product(productName, productPrice, productPhoto, productType, productAmount,
				productCreater, productPublisher, productDate,productSelve);

		pService.insert(newProd);

		return "redirect:/product/productlist";
	}

	// 先拿到要改的資料才能改，修改直接跳另一頁

	@GetMapping("/products/edit")
	public String editProductPage(@RequestParam("id1") Integer id, Model model) {
		Product p1 = pService.findById(id);
		Course course = p1.getCourse();
		model.addAttribute("product", p1);
		model.addAttribute("course", course);
		return "siao/product/productManagement/pEdit";
	}

	/// 使用put方法將資料更新進資料庫 put是修改

	@PutMapping("/products/putedit")
	public String sendEditedProduct(@ModelAttribute("Product") Product prod,
			@RequestParam("courseId") Integer cId,
			@RequestParam("photoFile") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				String encode64 = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(file.getBytes());
				prod.setProductPhoto(encode64);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Course course = cService.findCourseById(cId);
			prod.setCourse(course);
			pService.insert(prod);
			return "redirect:/product/productlist";
	}

	// 刪除資料
	@DeleteMapping("/products/delete")
	public String deleteProduct(@RequestParam("id") Integer id) {
		pService.deleteById(id);
		return "redirect:/product/productlist";
	}
	
	
	// 查詢資料
	
	@GetMapping("/products/search")
	public String SearchByCondition(@RequestParam("searchbar") String searchString,Model model) {
		List<Product> outcome = pService.fuzzySearch(searchString);

		model.addAttribute("allProducts", outcome);
		return "siao/product/productManagement/pCRUD";
	}

	////////////////////// for前端的controller///////////////////////

	@ResponseBody
	@PostMapping("/productsFront/page")
	public Page<Product> showProductByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<Product> page = pService.showProdOnSelve(pageNumber);

		return page;
	}
	// 呼叫選到的產品

	@GetMapping("/productFront/selectedProduct")
	public String showOneProduct(@RequestParam(name = "id") Integer productId, Model model) {
		Product chosenProduct = pService.findById(productId);
		model.addAttribute("chosenProduct", chosenProduct);
		return "siao/product/productClientSide/oneProduct";
	}
	
	@PostMapping("productFront/conditionProduct")
	public Page<Product> showProductByChoosed(@RequestParam(name="firstCondition") String firstCondition,@RequestParam(name="secondCondition") String secondCondition){
		return null;
	}
	
	//判斷為課程還是書籍進入新增頁面
	@GetMapping("/insertCorB")
	public String insertCourseOrBook(@RequestParam("id1") Integer id, RedirectAttributes ra, Model m) {
		Product pId = pService.findById(id);
		String type = pId.getProductType();
		Course porra = pId.getCourse();
		m.addAttribute("product", pId);
		if(type.equals("2")) {
			if(porra == null) {
				return "chou/CourseInsert";
			}
			else {
				ra.addAttribute("courseId", porra.getCourseId());
				return "redirect:/course/edit";
			}
		}else {
			return "dom/BookInsert";
		}
	}
	
}
