package com.onlineLearning.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlineLearning.model.ChatMember;
import com.onlineLearning.model.Member;
import com.onlineLearning.model.MemberMessageModel;
import com.onlineLearning.service.MemberService;
import com.onlineLearning.util.UserUtil;

@RestController
@ServerEndpoint(value = "/theMessenger/{id}")
public class MemberEndPoint {

	private static ConcurrentHashMap<String, MemberEndPoint> clientSocket = new ConcurrentHashMap<String, MemberEndPoint>();

	private static ConcurrentHashMap<String, MemberEndPoint> serviceWebSocket = new ConcurrentHashMap<String, MemberEndPoint>();

	private static MemberService memberService;

	private String id;

	private Session session;

	@Autowired
	public void SetMemberService(MemberService MemberService) {
		MemberEndPoint.memberService = MemberService;
	}

	@OnOpen
	public void onOpen(Session session, @PathParam("id") String id) throws Exception {

		if (!id.equals("CS")) {
			this.id = id;
			this.session = session;
			
			Set<ChatMember> set = UserUtil.getAllUser();
			Iterator<ChatMember> it = set.iterator();
			while (it.hasNext()) {
				ChatMember member = it.next();
				if (member.getChatMemberId().equals(String.valueOf(id))) {
					clientSocket.put(id, this);
					return;
				}
			}
			
			Member member = memberService.myFindMemberById(id);
			ChatMember chatMember = new ChatMember(this.id, member.getMemberAccount(), member.getMemberName(),
					member.getMemberPhoto());
			UserUtil.putNewMember(chatMember);

			if (!serviceWebSocket.isEmpty()) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = dateFormat.format(new Date());
				MemberMessageModel messageModel = new MemberMessageModel(this.id, "CS", "NewMember",
						member.getMemberPhoto(), member.getMemberName() + "進入對話", date, member.getMemberAccount());
				ObjectMapper objectMapper = new ObjectMapper();
				String msg = objectMapper.writeValueAsString(messageModel);
				sendMessageToAllCS(msg);
			}
			clientSocket.put(id, this);
		}

		if (id.equals("CS")) {
			this.id = id;
			this.session = session;
			serviceWebSocket.put(id, this);
		}
	}

	@OnClose
	public void onClose() throws IOException {
		try {
			UserUtil.removeUser(this.id);
			clientSocket.remove(this.id, this);
			serviceWebSocket.remove(this.id, this);
		} catch (Exception e) {
			;
		}
	}

	@OnMessage
	public void onMessage(String message, Session session, @PathParam("id") String id) throws IOException {

		if (id.equals("CS")) {
			ObjectMapper objectMapper = new ObjectMapper();
			MemberMessageModel model = objectMapper.readValue(message, MemberMessageModel.class);
			sendMessageToId(model.getSendTo(), model.getMessage());
		}
		if (!id.equals("CS") && !serviceWebSocket.isEmpty()) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = dateFormat.format(new Date());
			Member member;
			try {
				member = memberService.myFindMemberById(id);
				MemberMessageModel model = new MemberMessageModel(id, "CS", "會員回應", member.getMemberPhoto(), message,
						date, member.getMemberAccount());
				ObjectMapper objectMapper = new ObjectMapper();
				String msg = objectMapper.writeValueAsString(model);
				sendMessageToAllCS(msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println(error);
	}

	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
	}

	public void sendMessageToId(String id, String message) throws IOException {
		clientSocket.get(id).sendMessage(message);
	}

	public void sendMessageToAllClient(String message) throws IOException {
		for (String key : clientSocket.keySet()) {
			try {
				clientSocket.get(key).sendMessage(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void sendMessageToAllCS(String message) throws IOException {
		for (String key : serviceWebSocket.keySet()) {
			try {
				serviceWebSocket.get(key).sendMessage(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}