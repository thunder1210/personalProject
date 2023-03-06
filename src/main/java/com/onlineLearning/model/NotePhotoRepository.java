package com.onlineLearning.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NotePhotoRepository extends JpaRepository<NotePhoto, Integer> {
	
	@Query(value = "SELECT TOP(1) * FROM dbo.notePhoto ORDER BY notePhotoUploadTime DESC", nativeQuery = true)
	public NotePhoto getLatestNotePhoto();
	
}	

