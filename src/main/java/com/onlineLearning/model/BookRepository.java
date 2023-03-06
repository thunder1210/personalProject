package com.onlineLearning.model;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface BookRepository extends JpaRepository<Book, Integer> {

	@Query(value = "from Book where bookType = :bookType")
	public List<Book> findByBookType(@PathParam("bookType") String bookType);

	@Query(value = "from Book where bookName like %:bookName%")
	public List<Book> findByName(@Param("bookName") String bookName);

}