package com.onlineLearning.util;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import com.onlineLearning.model.ChatMember;

public class UserUtil {

	private static Set<ChatMember> onlineMemberlist = new LinkedHashSet<ChatMember>();

	public static void putNewMember(ChatMember chatmember) {
		Integer result = 0;
		Iterator<ChatMember> it = onlineMemberlist.iterator();
		while (it.hasNext()) {
			ChatMember next = it.next();
			if (next.getChatMemberAccount().equals(chatmember.getChatMemberAccount())) {
				result = 1;
			}
		}
		if (result != 1) {
			onlineMemberlist.add(chatmember);
		}
	}

	public static Set<ChatMember> getAllUser() {
		return onlineMemberlist;
	}
	
	public static void removeUser(String mebmerId) {
		Iterator<ChatMember> it = onlineMemberlist.iterator();
		while(it.hasNext()) {
			ChatMember chatMember = it.next();
			if(chatMember.getChatMemberId()==mebmerId) {
				onlineMemberlist.remove(chatMember);
			}
		}
	}
}