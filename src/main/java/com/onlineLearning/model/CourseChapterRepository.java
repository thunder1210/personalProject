package com.onlineLearning.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CourseChapterRepository extends JpaRepository<CourseChapter, Integer> {

	@Query(value = "select top 1　* from courseChapter where FKCourseId = :courseId", nativeQuery = true)
	public CourseChapter showFirstChapter(@Param("courseId")Integer courseId);

}
