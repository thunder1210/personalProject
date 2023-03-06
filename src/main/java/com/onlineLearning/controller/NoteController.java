package com.onlineLearning.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onlineLearning.model.Member;
import com.onlineLearning.model.Note;
import com.onlineLearning.model.NotePhoto;
import com.onlineLearning.service.MemberService;
import com.onlineLearning.service.NoteService;

// http://localhost:8080/onlinelearning/note/user/noteTest
// http://localhost:8080/onlinelearning/note/user/myNotes/

@Controller
public class NoteController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("note/user/noteTest")
	public String toNoteTestPage() {
		return "/liu/note/user/NoteTest";
	}
	
	@GetMapping("note/user/myNotes")
	public String toMyNotesPage() {
//		List<Note> notesList = noteService.refreshMemberNotesCard(fkMemberId);
//		model.addAttribute("notesList", notesList);
		return "/liu/note/user/MyNotes";
	}
	
	@GetMapping("note/user/tinymceTest")
	public String toTinymceTestPage() {
//		List<Note> notesList = noteService.refreshMemberNotesCard(fkMemberId);
//		model.addAttribute("notesList", notesList);
		return "/liu/note/user/TinymceTest";
	}
	
	@ResponseBody
	@PostMapping("/note/user/test/add")
	public String addNewNoteAndPhotoTest(
			@ModelAttribute Note note,
			@RequestParam("noteTitle") String noteTitle,
			@RequestParam("noteContent") String noteContent,
			@RequestParam("noteAccess") String noteAccess,			
			@RequestParam("memberId") Integer fkMemberId, 
			@RequestParam("notePhotoFiles[]") List<MultipartFile> notePhotoFiles			
			) {
		
		List<NotePhoto> notePhotoList = noteService.convertNotePhotoFiles(notePhotoFiles, note);
		
		Member member = memberService.findMemberById(fkMemberId);
		
		note.setNoteTitle(noteTitle);
		note.setNoteContent(noteContent);
		note.setNoteAccess(noteAccess);
		note.setMember(member);	
		note.setNotePhotoList(notePhotoList);
		
		noteService.addNote(note);
			
		return "筆記上傳成功";
	}
	
	@ResponseBody
	@PostMapping("/note/user/getAll")
	public List<Note> getAllNotesAndPhotos(
			@RequestBody Member member
			) {
		Integer fkMemberId = member.getMemberId();
		List<Note> notesList = noteService.refreshMemberNotesCard(fkMemberId);
		return notesList;
	}
	
	
	@ResponseBody
	@PostMapping("/note/user/addNew")
	public Note addNewNoteAndPhoto(
			@RequestBody Note note
			) {
		Integer fkMemberId = note.getMemberId();
		note.setMember(memberService.findMemberById(fkMemberId));
		noteService.addNote(note);
		return noteService.getLatestNoteOfCurrMember(fkMemberId);
	}
	
	@ResponseBody
	@PutMapping("/note/user/edit")
	public Note editNoteAndPhoto(
			@RequestBody Note note
			) {
		noteService.updateNote(note);
		return note;
	}
	
	@ResponseBody
	@PutMapping("/note/user/stick")
	public String stickNote (
			@RequestBody Note note
			) {
		noteService.stickNote(note);
		return "筆記置頂成功";
	}
	
	@ResponseBody
	@GetMapping("/note/user/getOneNote")
	public Note getOneNoteByNoteId(@RequestParam("noteId") Integer noteId) {
		Optional<Note> optional = noteService.getNoteByNoteId(noteId);
		
		if (optional.isEmpty()) {
			return null;
		}

		Note note = optional.get();
		
		return note;
	}
	
	@ResponseBody
	@GetMapping("/note/user/note-get-photoIds")
	public List<Integer> getPhotoIdsByNoteId(@RequestParam("noteId") Integer noteId) {
		Optional<Note> optional = noteService.getNoteByNoteId(noteId);
		
		if (optional.isEmpty()) {
			return null;
		}

		Note note = optional.get();
		
		return noteService.getNotePhotoIdsByNote(note);
	}
	
	
	
	@ResponseBody
	@PostMapping("/note/user/notephoto/upload")
	public String uploadNotePhoto(
			@RequestParam("notePhotoFile") MultipartFile notePhotoFile,
			@RequestParam("noteId") Integer noteId) {
		Note note = new Note();
		Optional<Note> optional = noteService.getNoteByNoteId(noteId);
		if (optional != null) {
			note = optional.get();
		}
		NotePhoto notePhoto = noteService.convertOneNotePhotoFile(notePhotoFile, note);
		noteService.addNotePhoto(notePhoto);
	
		return "圖片上傳成功";

	}
	
	
	@ResponseBody
	@GetMapping("/note/user/notePhoto")
	public String getNotePhotoById(@RequestParam("notePhotoId") Integer notePhotoId) {
		Optional<NotePhoto> optional = noteService.getNotePhotoByNotePhotoId(notePhotoId);
		
		if (optional.isEmpty()) {
			return null;
		}
		
		NotePhoto notePhoto = optional.get();
		String notePhotoContent = notePhoto.getNotePhotoContent();
	
		return notePhotoContent;

	}
	
	@ResponseBody
	@DeleteMapping("/note/user/delete")
	public String deleteNoteByNoteId(@RequestParam("noteId") Integer noteId) {
		Optional<Note> optional = noteService.getNoteByNoteId(noteId);
		
		if (optional.isEmpty()) {
			return "查無資料";
		}
		
		noteService.deleteNoteByNoteId(noteId);
	
		return "刪除成功";

	}

}
