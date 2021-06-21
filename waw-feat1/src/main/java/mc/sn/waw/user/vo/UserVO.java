package mc.sn.waw.user.vo;



import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component("userVO")
public class UserVO {
	
	private String email;
	private String id;
	private String pwd;
	private String name;
	private String phoneNumber;
	
		
	String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
	@Override
	public String toString() {
		return "UserVO [email=" + email + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", phoneNumber="
				+ phoneNumber + "]";
	}
	
	
}
