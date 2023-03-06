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

import com.onlineLearning.model.Book;
import com.onlineLearning.model.BookRepository;

@Service
@Transactional
public class BookService {

	@Autowired
	private BookRepository bookDao;

	public void insert(Book book) {
		bookDao.save(book);
	}

	public Book findByid(Integer id) {
		Optional<Book> optional = bookDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}
		System.out.println("查無此" + id + "資料");
		return null;
	}

	public List<Book> findAllPhoto() {
		return bookDao.findAll();
	}

	public void deleteById(Integer id) {
		bookDao.deleteById(id);
	}

	public void deleteByEntity(Book book) {
		bookDao.delete(book);
	}

	public Book updateBookById(Integer id) {
		return bookDao.findById(id).get();

	}

	public List<Book> findBookByType(String book) {
		return bookDao.findByBookType(book);
	}

	public List<Book> findBookByName(String name) {
		return bookDao.findByName(name);
	}
	
	public Page<Book> getBooksByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 8,Sort.Direction.ASC, "bookid");
		
		Page<Book> page = bookDao.findAll(pgb);
		
		return page;
	}

}