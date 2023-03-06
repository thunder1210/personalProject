package com.onlineLearning.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface BlogPostRepository extends JpaRepository<BlogPost, Integer> {
	
	public BlogPost findFirstByOrderByBlogPostDateDesc();
	
	@Query(value = "SELECT * FROM dbo.blogPost WHERE FKmemberId=:memberId", nativeQuery = true)
	public List<BlogPost> getAllPostByMemberId(@Param("memberId") Integer memberId);

	
	
}
