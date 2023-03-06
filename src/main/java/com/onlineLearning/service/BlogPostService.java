package com.onlineLearning.service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onlineLearning.model.BlogPost;
import com.onlineLearning.model.BlogPostRepository;

@Service
@Transactional
public class BlogPostService {
	
	@Autowired
	private BlogPostRepository bgpDao;
	
	public List<BlogPost> showAllArticles(){
		List<BlogPost> list = bgpDao.findAll();
		if(list.isEmpty()){
			System.out.println("沒有資料!!!");
		}
		return list;
	}
	
	public BlogPost getLatestBlogPost() {
		return bgpDao.findFirstByOrderByBlogPostDateDesc();
	}
	
	public List<BlogPost> showAllPosts(Integer memberId){
		List<BlogPost> list = bgpDao.getAllPostByMemberId(memberId);
		if(list.isEmpty()){
			System.out.println("沒有資料~~~");
		}
		return list;
	}	
	
	public BlogPost findById(Integer id) {
		Optional<BlogPost> optional = bgpDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}
		System.out.println("沒找到id 為" + id + "的資料");
		return null;
	}
	
	public void insert(BlogPost bgp) {
		bgpDao.save(bgp);
	}
	
	public String convertBlogPhotoFile(MultipartFile blogPhotoFile) {
		String base64Prefix = "data:image/png;base64,";
		String photoContent;
		try {
			photoContent = base64Prefix + Base64.getEncoder().encodeToString(blogPhotoFile.getBytes());
			return photoContent;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
		
	public void deleteByBlogPostId(Integer blogPostId) {
		bgpDao.deleteById(blogPostId);
	}

	public void deleteByEntity(BlogPost bgp) {
		bgpDao.delete(bgp);
	}

	public void updateByBlogPost(BlogPost bgp) {
		bgpDao.save(bgp);
	}

}
