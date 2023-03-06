package com.onlineLearning.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CourseRepository extends JpaRepository<Course, Integer> {

	//nativeQuery = true -->用SQL語言
	@Query(value = "select * from Course c where c.CourseName like %:keyword% or c.CourseType like %:keyword%", nativeQuery = true)
	List<Course> findByKeyword(@Param("keyword") String keyword);

	public Course findFirstByOrderByCourseIdDesc();
	
	@Query(value = "from Course where type = :type")
	public Course findCourseByType(@Param("type") String type);
	

}
