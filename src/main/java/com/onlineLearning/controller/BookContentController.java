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

import com.onlineLearning.model.BookContent;
import com.onlineLearning.service.BookContentService;

@Controller
public class BookContentController {
	
	@Autowired
	private BookContentService BoContentService;
	
	@GetMapping("/bookContentIndex")
	public String BookContentIndex() {
		return "dom/BookContentIndex";
	}
	
//	找 "值" 去新增
	@GetMapping("/bookContentAdd")
	public String BookContentAdd() {
		return "dom/BookContentInsert";
	}
	
	@PostMapping("/bookContentInsert")
	public String BooksContentInsert(
			@RequestParam("bookChapter") String bookChapter,
			@RequestParam("content") String content,
			@RequestParam("bookContentPhoto") MultipartFile bookContentPhoto) throws IOException{
		BookContent BookContentInsert = new BookContent();
		BookContentInsert.setBookChapter(bookChapter);
		BookContentInsert.setContent(content);
		BookContentInsert.setBookContentPhoto(bookContentPhoto.getBytes());
		
		BoContentService.insert(BookContentInsert);
				return "redirect:/AllContent";}
	
//	透過 "id" 傳回圖片
	@ResponseBody
	@GetMapping("/bookContentPhoto")
	public byte[] getContentPhoto(@RequestParam("id") Integer id) {
		return BoContentService.findContentById(id).getBookContentPhoto();
	}
	
//	http://localhost:8080/onlinelearning/AllContent
//	找全部文章
	@GetMapping("/AllContent")
	public String AllBooksContent(Model model) {
		List<BookContent> AllContent = BoContentService.findAllBookContent();
		model.addAttribute("bookContent",AllContent);
		return "dom/BookContentIndex";
	}
	
	@DeleteMapping("/bookContentDelete")
	public String deleteBookContent(@RequestParam("bookContentId") Integer bookContentId) {
		BoContentService.deleteById(bookContentId);
		return "redirect:/AllContent";
	}
	
//	編輯
	@GetMapping("/EditContent")
	public String EditBookContent(@RequestParam("bookContentId") Integer bookContentId,Model model) {
		BookContent bookContent1 = BoContentService.findContentById(bookContentId);
		model.addAttribute("bookContent",bookContent1);
		return "dom/EditBookContent";
	}
//	更新後回傳
	@PostMapping("/EditBookContentSend")
	public String sendEditBookContent(@RequestParam("thePhoto") MultipartFile photobyte,
			@ModelAttribute("bookContent") BookContent bookContent)
			throws IOException {
		
		byte[] bytes = photobyte.getBytes();
		bookContent.setBookContentPhoto(bytes);
		BoContentService.insert(bookContent);
		
		return "redirect:/AllContent";
	}
	
	
	
	
	
	
	
	
	
	
	
}
