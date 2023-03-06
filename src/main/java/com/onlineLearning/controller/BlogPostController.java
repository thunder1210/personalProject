package com.onlineLearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlineLearning.model.BlogPost;
import com.onlineLearning.service.BlogPostService;
import com.onlineLearning.service.MemberService;

// http://localhost:8080/onlinelearning/blogindex
// http://localhost:8080/onlinelearning/blogedit

@Controller
public class BlogPostController {

	@Autowired
	private BlogPostService bService;

	@Autowired
	private MemberService mService;

	@GetMapping("/blogindex")
	public String blogindex(Model model) {

		List<BlogPost> list = bService.showAllArticles();
		model.addAttribute("indexlist", list);
		return "chen/BlogIndex";
	}

	@GetMapping("/blogedit")
	public String blogedit(@RequestParam("memberId") Integer memberId, Model model) {

		List<BlogPost> list = bService.showAllPosts(memberId);
		model.addAttribute("editlist", list);
		return "chen/BlogEdit";
	}

	@ResponseBody
	@GetMapping("/blogpost/get")
	public String blogedit(Model model) {

		BlogPost newBgp = new BlogPost();
		model.addAttribute("blogpost", newBgp);
		BlogPost latestBgp = bService.getLatestBlogPost();
		model.addAttribute("latestBgp", latestBgp);

		return "chen/BlogEdit";
	}
	
	@PostMapping("/blogedit/post/normal")
	public String addBgp(@RequestParam("memberId") Integer memberId,
			@RequestParam("postType") String postType, @RequestParam("postTitle") String postTitle,
			@RequestParam("postContent") String postContent,
			@RequestParam("postPhotoFile") MultipartFile postPhotoFile, Model model, RedirectAttributes redirectAttributes) {
		BlogPost newBgp = new BlogPost();
		newBgp.setBlogPostType(postType);
		newBgp.setBlogPostTitle(postTitle);
		newBgp.setBlogPostContent(postContent);
		newBgp.setMember(mService.findMemberById(memberId));
		String postPhoto = bService.convertBlogPhotoFile(postPhotoFile);
		if (postPhoto != null) {
			newBgp.setBlogPostPhoto(postPhoto);
		}
		bService.insert(newBgp);
		redirectAttributes.addAttribute("memberId", memberId);
		return "redirect:/blogedit";
	}
		
	@ResponseBody
	@PostMapping("/blogedit/post/ajax")
	public BlogPost addBgp(@RequestParam("memberId") Integer memberId,
			@RequestParam("blogPostType") String postType, @RequestParam("blogPostTitle") String postTitle,
			@RequestParam("blogPostContent") String postContent
			,@RequestParam("blogPostMultipart") MultipartFile postPhotoFile
			) {
		BlogPost newBgp = new BlogPost();
		newBgp.setBlogPostType(postType);
		newBgp.setBlogPostTitle(postTitle);
		newBgp.setBlogPostContent(postContent);
		newBgp.setMember(mService.findMemberById(memberId));
		String postPhoto = bService.convertBlogPhotoFile(postPhotoFile);
		if (postPhoto != null) {
			newBgp.setBlogPostPhoto(postPhoto);
		}
		bService.insert(newBgp);

		BlogPost latestBgp = bService.getLatestBlogPost();

		return latestBgp;
	}
	
	@ResponseBody
	@PostMapping("/blogedit/post")
	public BlogPost addBgp(@RequestBody BlogPost newBgp) {

		newBgp.setMember(mService.findMemberById(newBgp.getMemberId()));
		String postPhoto = bService.convertBlogPhotoFile(newBgp.getBlogPostMultipart());
		if (postPhoto != null) {
			newBgp.setBlogPostPhoto(postPhoto);
		}
		bService.insert(newBgp);
		BlogPost latestBgp = bService.getLatestBlogPost();

		return latestBgp;
	}
	
//	@ResponseBody
//	@PostMapping("/blogedit/post")
//	public BlogPost addBgp(@RequestBody BlogPost newBgp) {
//
//		newBgp.setMember(mService.findMemberById(newBgp.getMemberId()));
//		
//		bService.insert(newBgp);
//		BlogPost latestBgp = bService.getLatestBlogPost();
//
//		return latestBgp;
//	}

//	@ResponseBody
//	@PostMapping("/blogedit/post")
//	public List<BlogPost> (@RequestBody BlogPost bgp) {
//		bService.insert(bgp);
//		
//		List<BlogPost> resultList = .getContent();
//		
//		return resultList;	
//	}
	
	@ResponseBody
	@DeleteMapping("/blogedit/delete")
	public String deleteByEntity(@RequestBody BlogPost bgp) {
		bService.deleteByEntity(bgp);
		return "";
	}
	
	@ResponseBody
	@PutMapping("/blogedit/put")
	public String updateByBlogPost(@RequestBody BlogPost bgp) {
		bService.updateByBlogPost(bgp);
		return "";
	}

}
