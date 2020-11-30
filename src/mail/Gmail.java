package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
		
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("g메일 아이디만입력", "비밀번호 입력");
	}
	
}
