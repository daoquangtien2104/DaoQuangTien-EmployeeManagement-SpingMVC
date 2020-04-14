package com.quangtien.sendmail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.quangtien.model.Record;
@Service
public class Mailer 
{
	@Autowired
	JavaMailSender mailSender;

	public void sendMail(String to,Record record)
	{
		String noiDung =
						"Gửi Nhân Viên : " + record.getStaff().getName() + "\n "
						+ "Lý do: " + record.getReason() + "\n"
						+ "Loại ghi nhận: " +  (record.isType() ? "Thuong" : "Phat");
		
		System.out.println(record.getStaff().getName());
		try 
		{
			SimpleMailMessage email = new SimpleMailMessage();
	        email.setTo(to);
	        email.setSubject("Tiêu đề");
	        email.setText(noiDung);
			
			mailSender.send(email);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

	}
}
