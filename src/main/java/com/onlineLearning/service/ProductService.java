package com.onlineLearning.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineLearning.model.Product;
import com.onlineLearning.model.ProductRepository;

@Service
@Transactional
public class ProductService {
	@Autowired
	private ProductRepository proDao;

	public void insert(Product product) {
		System.out.println("insert");
		proDao.save(product);
	}

	public Product findById(Integer id) {
		Optional<Product> optional = proDao.findById(id);

		if (optional.isPresent()) {
			Product product = optional.get();
			return product;
		}
		System.out.println("沒找到id 為" + id + "的資料");
		return null;
	}

	public void deleteById(Integer id) {
		proDao.deleteById(id);
	}

	public Page<Product> getProductByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "productId");

		Page<Product> page = proDao.findAll(pgb);

		return page;
	}

	public List<Product> findAllProd() {
		
		List<Product> all = proDao.findAll();
		
		return all;
	}
	public List<Product> fuzzySearch(String keyword){
		List<Product> fuzzy = proDao.findByKeyword(keyword);
		return fuzzy;
	}
	
	public Page<Product> showProdOnSelve(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "productId");

		Page<Product> page = proDao.onSelve(pgb);

		return page;
	}
	
}
