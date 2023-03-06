package com.onlineLearning.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.onlineLearning.model.Note;
import com.onlineLearning.model.NotePhoto;
import com.onlineLearning.model.NotePhotoRepository;
import com.onlineLearning.model.NoteRepository;


@Service
@Transactional
public class NoteService {
	
	String base64Prefix = "data:image/png;base64,";
	
	@Autowired
	public NoteRepository noteDao;
	
	@Autowired
	public NotePhotoRepository notePhotoDao;
	
	public void doNothing() {
		
	}
	
	public void addNote(Note note) {
		noteDao.save(note);
	}
	
	public void addNotePhoto(NotePhoto notePhoto) {
		notePhotoDao.save(notePhoto);
	}
	
	
	public NotePhoto convertOneNotePhotoFile(MultipartFile notePhotoFile, Note note) {
		
			NotePhoto notePhoto = new NotePhoto();
			try {
				String photoContent = base64Prefix + Base64.getEncoder().encodeToString(notePhotoFile.getBytes());
				if (photoContent.equals(base64Prefix)) {
					return null;
				}
				if (!photoContent.equals(base64Prefix)) {	
					notePhoto.setNotePhotoContent(photoContent);
					notePhoto.setNote(note);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} 

		return notePhoto;
	}
	
	public List<NotePhoto> convertNotePhotoFiles(List<MultipartFile> notePhotoFiles, Note note) {
			
		List<NotePhoto> notePhotoList = new ArrayList<>();
		
		for (MultipartFile photoFile : notePhotoFiles) {
			try {
				String photoContent = base64Prefix + Base64.getEncoder().encodeToString(photoFile.getBytes());
				if (!photoContent.equals(base64Prefix)) {
					NotePhoto notePhoto = new NotePhoto();
					notePhoto.setNotePhotoContent(photoContent);
					notePhoto.setNote(note);
					notePhotoList.add(notePhoto);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
		return notePhotoList;
	}
	
	public Integer getLatestNoteId() {
		Note note = noteDao.findFirstByOrderByNoteCreateTimeDesc();
		return note.getNoteId();
	}
	
	public List<Note> getAllNotesByMemberId(Integer fkMemberId) {
		return noteDao.getAllNotesByMemberId(fkMemberId);
	}
	
	public List<Note> refreshMemberNotesCard(Integer fkMemberId) {
		return noteDao.getAllNotesByMemberIdByUpdateDesc(fkMemberId);
	}
	
	public Note getLatestNoteOfCurrMember(Integer fkMemberId) {
		return noteDao.getAllNotesByMemberIdByUpdateDesc(fkMemberId).get(0);
	}
	
	public Optional<Note> getNoteByNoteId(Integer noteId) {
		return noteDao.findById(noteId);
	}
	
	public List<Integer> getNotePhotoIdsByNote(Note note) {
		List<NotePhoto> notePhotoList = note.getNotePhotoList();
		
		List<Integer> notePhotoIdList = new ArrayList<>();
		
		for (NotePhoto notePhoto : notePhotoList) {
			Integer notePhotoId = notePhoto.getNotePhotoId();
			notePhotoIdList.add(notePhotoId);
		}
		return notePhotoIdList;
	}
	
	public Optional<NotePhoto> getNotePhotoByNotePhotoId(Integer notePhotoId) {
		return notePhotoDao.findById(notePhotoId);
	}
	
	public void updateNote(Note note) {
		Integer noteId = note.getNoteId();
		Note existingNote = noteDao.getNoteByNoteId(noteId);
		
		String oldTitle = existingNote.getNoteTitle();
		String oldContent = existingNote.getNoteContent();
		String noteTitle = note.getNoteTitle();
		String noteContent = note.getNoteContent();
		if (oldTitle.equals(noteTitle) && oldContent.equals(noteContent)) {
			doNothing();
		} else {
			Date noteLastUpdateTime = new Date();
			noteDao.updateNoteNative(noteTitle, noteContent, noteLastUpdateTime, noteId);
		}
	}
	
	public void stickNote(Note note) {
		Integer noteId = note.getNoteId();
		String noteTopSetting = note.getNoteTopSetting();
		Date noteLastUpdateTime = new Date();
		noteDao.stickNoteNative(noteTopSetting, noteLastUpdateTime, noteId);
	}
	
	public void deleteNoteByNoteId(Integer NoteId) {
		noteDao.deleteById(NoteId);
	}
	
	public NotePhoto getLatestNotePhoto() {
		return notePhotoDao.getLatestNotePhoto();
	}
}
