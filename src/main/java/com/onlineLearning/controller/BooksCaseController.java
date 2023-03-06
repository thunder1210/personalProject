package com.onlineLearning.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onlineLearning.model.Book;
import com.onlineLearning.service.BookService;

@Controller
public class BooksCaseController {

	@Autowired
	private BookService BService;

//	http://localhost:8080/onlinelearning/book/AllCaseBooks
	@GetMapping("/book/AllCaseBooks")
	public String AllBooks(Model model) {
		List<Book> AllBook = BService.findAllPhoto();
		model.addAttribute("books", AllBook);
		return "dom/MyBookCase";
	}

	@GetMapping("/book/Booksedit")
	public String EditBook(@RequestParam("bookId") Integer bookId, Model model) {

		Book book1 = BService.findByid(bookId);
		model.addAttribute("books", book1);

		return "dom/MyBookCase";
	}

	@PostMapping("/book/Bookseditpost")
	public String sendEditedBook(@RequestParam("theBookPhoto") MultipartFile photo, @ModelAttribute("book") Book book)
			throws IOException {

		byte[] bytes = photo.getBytes();
		book.setBookPhoto(bytes);
		BService.insert(book);
		return "redirect:/book/AllCaseBooks";
	}

	@ResponseBody
	@GetMapping("/book/findBooksByType")
	public List<Book> findBooksByType(@RequestParam("bookType") String bookType) {
		return BService.findBookByType(bookType);
	}

//	已修正 跳至其他jsp即可
	@GetMapping("/findBooksByName")
	public String findBooksByName(@RequestParam("book") String bookName, Model model) {
		List<Book> findName = BService.findBookByName(bookName);
		model.addAttribute("book",findName);
		
		return "dom/MyBookCaseForSearch";
		
	}
	
	
//	http://localhost:8080/onlinelearning/book/page
//	前往 Book 頁面
	@GetMapping("/page")
	public String showBooksByPage(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber, Model model) {
		
		Page<Book> page = BService.getBooksByPage(pageNumber);
		model.addAttribute("book", page);
		
		return "dom/MyBookCase";
	}
	
}