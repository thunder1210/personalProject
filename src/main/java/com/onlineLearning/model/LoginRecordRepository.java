package com.onlineLearning.model;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LoginRecordRepository extends JpaRepository<LoginRecord, Integer>, JpaSpecificationExecutor<LoginRecord> {
	
	@Query(value = "from Member where memberAccount = :ac")
	public Member findTheMemberByAccount(@Param("ac") String ac);
	
	@Query(value = "select * from LoginRecord where FKmemberId = ?1",
		    countQuery = "select count(*) FROM LoginRecord WHERE FKmemberId = ?1",
		    nativeQuery = true)
		  Page<LoginRecord> findRecordsByMember(Integer memberId, Pageable pageable);

}
