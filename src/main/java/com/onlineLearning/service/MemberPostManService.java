package com.onlineLearning.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.onlineLearning.model.MemberPostManDelivery;

@Service
public class MemberPostManService implements MemberPostManDelivery {

	@Value("${spring.mail.username}")
	private String from;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public void sendMail(String to, String subject, String content) {
		try {
			SimpleMailMessage message = new SimpleMailMessage();

			message.setFrom(from);
			message.setTo(to);
			message.setCc(from);
			message.setSubject(subject);
			message.setText(content);

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendAttachFileMail(String to, String subject, String content, File file) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);

			messageHelper.setFrom(from);
			messageHelper.setTo(to);
			message.setSubject(subject);
			messageHelper.setText(content);
			messageHelper.addAttachment(file.getName(), file);
			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendHtmlVerifyMail(String to, String subject, int code) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);
			String content = "<!DOCTYPE html>\r\n"
					+ "<html lang=\"UTF-8\">\r\n"
					+ "<head>\r\n"
					+ "<meta charset=\"UTF-8\">\r\n"
					+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
					+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
					+ "<title>Document</title>\r\n"
					+ "</head>\r\n"
					+ "<body>\r\n"
					+ "<div style=\"background-image: url(https://c1.wallpaperflare.com/preview/361/611/665/background-leaves-white-wood-card.jpg);position: relative;top: 50%;background-repeat: no-repeat;background-size:auto;transform: translate(-50%);left: 50%;border: 3px double black;padding: 5px;width: 700px;height: 500px;\">\r\n"
					+ "<div style=\"border: 3px double black;width: 690px;background-color: rgb(237, 239, 239);opacity: 0.8;\">\r\n"
					+ "<h1 style=\"text-align: center;background-color: rgb(239, 239, 239);\">歡迎加入THUNDER學習平台</h1>\r\n"
					+ "</div>\r\n"
					+ "<p style=\"font-size: 35px;margin-left: 55%;margin-top: 30%;font-weight: bolder;\">您的驗證碼為<br>\r\n"
					+ "<p style=\"font-size: 35px;margin-left: 55%;font-weight: bolder;\">" + code + "</p></p>\r\n"
					+ "</div>\r\n"
					+ "</body>\r\n"
					+ "</html>";
			messageHelper.setFrom(from);
			messageHelper.setTo(to);
			message.setSubject(subject);
			messageHelper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendHtmlMail(String to, String subject, String content) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);
			messageHelper.setFrom(from);
			messageHelper.setTo(to);
			message.setSubject(subject);
			messageHelper.setText(content, true);
			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}