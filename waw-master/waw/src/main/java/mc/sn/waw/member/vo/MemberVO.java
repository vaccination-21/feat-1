package mc.sn.waw.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
//유저테이블 
public class MemberVO {
	 // 프라이머리 키 
    private Integer tid;
    // 아이디 
    private String email;
    // 비밀번호 
    private String pwd;    
    // 이름 
    private String name;
    // 닉네임 
    private String nickname;
    // 생년월일 
    private Date birth;      
    // 휴대폰번호 
    private String phone;
    // 생성일 
    private Date creationDate;
   

	public MemberVO() {
		
	}
	public MemberVO(String name, String phone, Date birth) {
		this.name =name;
		this.phone =phone;
		this.birth = birth;
	}

	public MemberVO(String email, String pwd,  String name, String nickname, Date birth, String phone) {	
		this.email = email;
		this.pwd = pwd;		
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;		
		this.phone = phone;
	}

	public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

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
 
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

   
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    
}
