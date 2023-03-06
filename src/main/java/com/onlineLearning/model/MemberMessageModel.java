package com.onlineLearning.model;

public class MemberMessageModel {

	private String senderId; 
	
	private String sendTo;
	
	private String sendType;
	
	private String senderPhoto;
	
	private String message;
	
	private String messageTime;
	
	private String senderAccount;
	
	public MemberMessageModel() {
		
	}

	public MemberMessageModel(String senderId, String sendTo, String message, String messageTime) {
		super();
		this.senderId = senderId;
		this.sendTo = sendTo;
		this.message = message;
		this.messageTime = messageTime;
	}
	
	public MemberMessageModel(String senderId, String sendTo, String sendType, String senderPhoto, String message,
			String messageTime, String senderAccount) {
		super();
		this.senderId = senderId;
		this.sendTo = sendTo;
		this.sendType = sendType;
		this.senderPhoto = senderPhoto;
		this.message = message;
		this.messageTime = messageTime;
		this.senderAccount = senderAccount;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getSendTo() {
		return sendTo;
	}

	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}

	public String getSendType() {
		return sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String getSenderPhoto() {
		return senderPhoto;
	}

	public void setSenderPhoto(String senderPhoto) {
		this.senderPhoto = senderPhoto;
	}

	public String getSenderAccount() {
		return senderAccount;
	}

	public void setSenderAccount(String senderAccount) {
		this.senderAccount = senderAccount;
	}
}
