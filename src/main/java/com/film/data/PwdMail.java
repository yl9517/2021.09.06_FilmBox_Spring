package com.film.data;

import java.util.Properties;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.core.io.ClassPathResource;

import com.film.dto.UserDTO;

public class PwdMail {

	public void sendPwdEmail(UserDTO dto) throws Exception{
		//properties 불러오기
		ClassPathResource resource= new ClassPathResource("mail.properties");
		Properties prop = new Properties();
		prop.load(resource.getInputStream());
		
		//항목 읽어오기 (mail server 설정)
		String charSet = "utf-8";
		String hostSMTP = prop.getProperty("hostSMTP"); 		//SMTP 서버명
		String hostSMTPid = prop.getProperty("hostSMTPid"); 	//아이디
		String hostSMTPpwd = prop.getProperty("hostSMTPpwd");	//비밀번호
				
		//보내는 사람
		String fromEmail = "filmbox2021@naver.com";
		String fromName = "filmbox2021";
		
		//email 내용
		String msg="";
		msg+="<div style='text-align: center; border: 2px solid silver; line-height: 40px;'>";
		msg+="<h2>Filmbox 임시비밀번호입니다</h2>";
		msg+="<div>안녕하세요 Filmbox 입니다</div>";
		msg+="<div>요청하신 임시비밀번호를 안내해드립니다</div>";
		msg+="<div>아래 임시비밀번호를 로그인시 입력해주세요</div>";
		msg+="<table style='margin: 0 auto; width: 400px; height: 50px; border:1px solid silver; text-align: center; border-collapse: collapse;'>";
		msg+="<tbody>";
		msg+="<tr><td style='border: 1px solid silver; background-color: whitesmoke;'>임시비밀번호</td>";
		msg+="<td style='border: 1px solid silver; width: 70%; font: 18px solid; color: steelblue;'><strong>";
		msg+=dto.getMember_pwd()+"</strong> 입니다.</td></tr>";
		msg+="</tbody></table>";
		msg+="<div>이용해주셔서 감사합니다</div><br>";
		msg+="</div>";
		
		//email 보내기
		String toEmail = dto.getEmail();	//받는 사람 이메일 주소
		try {
			HtmlEmail email = new HtmlEmail();
			//email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);	//SSL 인지 TLS 인지(TLS가 없는 경우 SSL로 연결)
			email.setHostName(hostSMTP); 	//SMTP 서버명
			email.setSmtpPort(587);			//SMTP 포트 번호
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);	//TLS를 사용
			email.addTo(toEmail, dto.getMember_name(), charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject("[Filmbox] 임시비밀번호 발급 메일입니다");
			email.setMsg(msg);
			email.send();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
