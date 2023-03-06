package com.onlineLearning.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberExperienceRepository extends JpaRepository<MemberExperience, Integer> {

	@Query(value = "Select memberexperience.*, member.MemberPhoto, member.MemberName from memberexperience inner join member on member.MemberId = FKmemberId ORDER BY feedbackTime DESC", nativeQuery = true)
	public List<MemberExperienceData> findAllComments();
}
