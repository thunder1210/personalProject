package com.onlineLearning.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineLearning.model.BookContent;
import com.onlineLearning.model.BookContentRepository;

@Service
@Transactional
public class BookContentService {
	
	@Autowired
	private BookContentRepository bookContentDao;
	
	public void insert(BookContent bookContent) {
		bookContentDao.save(bookContent);
	}
	
	
	public BookContent findContentById(Integer id) {
		Optional<BookContent> optional= bookContentDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
			System.out.println("查無此筆資訊");
			return null;
	}
	
	public List<BookContent> findAllBookContent(){
		return bookContentDao.findAll();
	}
	
	public void deleteById(Integer id) {
		bookContentDao.deleteById(id);
	}
	
	public void deleteByEntity(BookContent bookContent) {
		bookContentDao.delete(bookContent);
	}
	
	public BookContent updateContentById(Integer id) {
		return bookContentDao.findById(id).get();
	}
	
	
	
	
	
	
}
