package com.onlineLearning.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineLearning.model.Comment;
import com.onlineLearning.model.CommentRepository;

@Service
@Transactional
public class CommentService {

	private CommentRepository commentDao;
	
	public void insert(Comment msg) {
		commentDao.save(msg);
	}
	
	public Comment findById(Integer id) {
		Optional<Comment> optional = commentDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		System.out.println("沒找到id 為" + id + "的資料");
		return null;
	}
	
	public void deleteById(Integer id) {
		commentDao.deleteById(id);
	}
	
	public void deleteByEntity(Comment msg) {
		commentDao.delete(msg);
	}
	
	public Comment getLatestMessage() {
		return commentDao.findFirstByOrderByCommentDateDesc();
	}
	
	public Page<Comment> getMessageByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3,Sort.Direction.DESC, "added");
		
		Page<Comment> page = commentDao.findAll(pgb);
		
		return page;
	}

}