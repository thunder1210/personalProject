package com.onlineLearning.model;

public class ChatMember {

	private String chatMemberId;
	
	private String chatMemberAccount;
	
	private String chatMemberName;
	
	private String chatMemberPhoto;
	
	public ChatMember() {
		
	}
	
	public ChatMember(String chatMemberId, String chatMemberAccount, String chatMemberName, String chatMemberPhoto) {
		super();
		this.chatMemberId = chatMemberId;
		this.chatMemberAccount = chatMemberAccount;
		this.chatMemberName = chatMemberName;
		this.chatMemberPhoto = chatMemberPhoto;
	}

	public String getChatMemberId() {
		return chatMemberId;
	}

	public void setChatMemberId(String chatMemberId) {
		this.chatMemberId = chatMemberId;
	}

	public String getChatMemberAccount() {
		return chatMemberAccount;
	}

	public void setChatMemberAccount(String chatMemberAccount) {
		this.chatMemberAccount = chatMemberAccount;
	}

	public String getChatMemberPhoto() {
		return chatMemberPhoto;
	}

	public void setChatMemberPhoto(String chatMemberPhoto) {
		this.chatMemberPhoto = chatMemberPhoto;
	}

	public String getChatMemberName() {
		return chatMemberName;
	}

	public void setChatMemberName(String chatMemberName) {
		this.chatMemberName = chatMemberName;
	}
	
}
