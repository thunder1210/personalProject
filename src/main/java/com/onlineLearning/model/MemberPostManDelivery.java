package com.onlineLearning.model;

import java.io.File;

public interface MemberPostManDelivery {

    void sendMail(String to, String subject, String content);

    void sendAttachFileMail(String to, String subject, String content, File file);

    void sendHtmlMail(String to, String subject, String content);

	void sendHtmlVerifyMail(String to, String subject, int code);
}