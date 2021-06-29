package mc.sn.waw.member.vo;

public class LoginVO {
	
	private String email;
	private String pwd;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	@Override
	public String toString() {
		return "LoginVO [email=" + email + ", pwd=" + pwd + "]";
	}
	

}
