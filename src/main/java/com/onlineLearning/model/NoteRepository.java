package com.onlineLearning.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public interface NoteRepository extends JpaRepository<Note, Integer> {

	public Note findFirstByOrderByNoteCreateTimeDesc();

	@Query(value = "SELECT * FROM dbo.note WHERE FKMemberId=:fkMemberId", nativeQuery = true)
	public List<Note> getAllNotesByMemberId(@Param("fkMemberId") Integer fkMemberId);

	@Query(value = "SELECT * FROM dbo.note WHERE NoteId=:noteId", nativeQuery = true)
	public Note getNoteByNoteId(@Param("noteId") Integer noteId);

	@Query(value = "SELECT * FROM dbo.note WHERE FKMemberId=:fkMemberId ORDER BY NoteLastUpdateTime DESC", nativeQuery = true)
	public List<Note> getAllNotesByMemberIdByUpdateDesc(@Param("fkMemberId") Integer fkMemberId);

	@Transactional
	@Modifying
	@Query(value = "UPDATE Note set NoteTitle=:noteTitle, NoteContent=:noteContent, NoteLastUpdateTime=:noteLastUpdateTime WHERE NoteId=:noteId", nativeQuery = true, countProjection = "Note")
	public void updateNoteNative(@Param("noteTitle") String noteTitle, @Param("noteContent") String noteContent, @Param("noteLastUpdateTime") Date noteLastUpdateTime, @Param("noteId") Integer noteId);

	@Transactional
	@Modifying
	@Query(value = "UPDATE Note set NoteTopSetting=:noteTopSetting, NoteLastUpdateTime=:noteLastUpdateTime WHERE NoteId=:noteId", nativeQuery = true, countProjection = "Note")
	public void stickNoteNative(@Param("noteTopSetting") String noteTopSetting, @Param("noteLastUpdateTime") Date noteLastUpdateTime, @Param("noteId") Integer noteId);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE Note set NoteContent=:noteContent WHERE NoteId=:noteId")
	public void updateNoteJPA(@Param("noteContent") String noteContent, @Param("noteId") Integer noteId);

	@Transactional
	@Modifying(clearAutomatically = true, flushAutomatically = true)
	@Query(value = "DELETE FROM note WHERE NoteId=:noteId", nativeQuery = true, countProjection = "Note")
	public void deleteNoteNative(@Param("noteId") Integer noteId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM Note WHERE NoteId=:noteId")
	public void deleteNoteJPA(@Param("noteId") Integer noteId);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM note", nativeQuery = true, countProjection = "Note")
	public void deleteAllNotesNative();

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM Note")
	public void deleteAllNotesJPA();
}
