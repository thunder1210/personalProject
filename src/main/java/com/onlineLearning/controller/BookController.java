package com.onlineLearning.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onlineLearning.model.Book;
import com.onlineLearning.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService Bservice;

//	前往後臺首頁
//	http://localhost:8080/onlinelearning/book/index
	@GetMapping("/book/index")
	public String BookIndex() {
		return "dom/BookBackend";
	}

	@GetMapping("/book/add")
	public String BookAdd() {
		return "dom/BookInsert";
	}

	@PostMapping("/book/insert")
	public String BookInsert(@RequestParam("bookName") String bookName, @RequestParam("bookType") String bookType,
			@RequestParam("bookPhoto") MultipartFile bookPhoto) throws IOException {
		Book bookInsert = new Book();

		bookInsert.setBookName(bookName);
		bookInsert.setBookType(bookType);
		bookInsert.setBookPhoto(bookPhoto.getBytes());

		Bservice.insert(bookInsert);
		return "redirect:/book/AllBooks";
	}

	@GetMapping("/book/AllBooks")
	public String AllBooks(Model model) {
		List<Book> AllBook = Bservice.findAllPhoto();
		model.addAttribute("books", AllBook);
		return "dom/BookBackend";
	}

	@ResponseBody
	@GetMapping("/book/photo")
	public byte[] getPhoto(@RequestParam("id") Integer id) {
		return Bservice.findByid(id).getBookPhoto();
	}

	@DeleteMapping("/book/delete")
	public String BookDelete(@RequestParam("bookId") Integer bookId) {
		Bservice.deleteById(bookId);
		return "redirect:/book/AllBooks";
	}

	@GetMapping("/book/edit")
	public String EditBook(@RequestParam("bookId") Integer bookId, Model model) {


		Book book1 = Bservice.findByid(bookId);
		model.addAttribute("book", book1);

		return "dom/BookEdit";
	}

	@PostMapping("/book/editpost")
	public String sendEditedBook(@RequestParam("theBookPhoto") MultipartFile photo, @ModelAttribute("book") Book book)

			throws IOException {

		byte[] bytes = photo.getBytes();
		book.setBookPhoto(bytes);
		Bservice.insert(book);
		return "redirect:/book/AllBooks";
	}
	
	

}
