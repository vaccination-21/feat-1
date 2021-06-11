package mc.sn.waw.user.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class UserVO {
	
	private String email;
	private String id;
	private String pwd;
	private String name;
	private int phoneNumber;
	private Date regDate;
}
