package com.onlineLearning.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, Integer> {

	public Comment findFirstByOrderByCommentDateDesc();

}
