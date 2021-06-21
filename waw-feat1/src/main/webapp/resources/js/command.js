/**
 * 
 */
$(document).on("click", "#logout", function(event) { //로그아웃 처리	
	$.post("/user/logout",
		{ },
		function(data, status){
		$.removeCookie("name");		  	
		$.removeCookie("logined");
						
		location.reload();						   
	  	}
	);//end post() 
});//end 로그아웃 처리

$(document).ready(function(){
	$("#login").click(function(){//로그인 처리	
		alert("클릭111")
		var _email=$("#email").val();
		var _pwd=$("#pwd").val();
		
		if (_email == '' || _pwd == '') {
			alert("아이디 또는 비밀번호가 입력되지 않았습니다.")
		}
		$.ajax({
			type:"post",
			url:"/login.do",
			data:{email:_email, pwd:_pwd},
			success:function(data, status){
				var obj = JSON.parse(data);
				if (obj.msg) {
					alert(obj.msg);
			  		location.reload();
			  	} else {
			  	
			  		data = obj.logoutBtn
			  		$.cookie("logined",data);
			  		$("#loginDiv").html(data);
			  					  		
		  		}
			},
			error:function(data, status,error){
				alert("rror")
			},
			complete:function(data, status){
				
			}
		
		});
	});

		
				
		$('#register').click(function(){ //회원 가입 처리
		alert("클릭회원가입")
		var _email = $('#email').val();
		var _id = $('#id').val();
		var _pwd = $('#name').val();
		var _name = $('#name').val();
		var _pwd2= $('#pwd2').val();		
		var _phoneNumber = $('#phoneNumber').val();
		
		var userInfo = {
		 email : _email,
		 id : _id,
		 pwd  : _pwd,
		 name : _name,		
		 phoneNumber : _phoneNumber,
		 };
		 
		if (_email == '') {
		alert("이메일을 입력해주세요.");
		return;
		}
		if (_id == '') {
		alert("아이디를 입력해주세요.");
		return;
		}
		if (_pwd == '') {
		alert("비밀번호를 입력해주세요.");
		return;
		}
		if (_name == '') {
		alert("이름을 입력해주세요.");
		return;
		}
		if (_pwd != _pwd2) {
		alert("비밀번호 확인과 일치하지 않습니다.");
		return;
		}		
		if (_phoneNumber == '') {
		alert("전화번호를 입력해주세요.");
		return;
		}
		
		$.ajax({
			type:"post",
			url:"/register.do",
			dataType: "text",
			data:Json.stringify(userInfo),
			success:function(result){
			consol.log("result:" +result);
			if(result === "register") {
				alert("성공")		
			}						
		});		
		
	};	
			
			
	


	$('#userFindEmail').click(function(){ // 이메일 찾기 처리
		var name = $('#Email').val();		
		var phone = $('#phoneNumber').val();
		
		if (name == '') {
		alert("이름을 입력해주세요.");
		return;
		}
		if (phone == '') {
		alert("전화번호를 입력해주세요.");
		return;
		}
			
		$.post("/user/userFindEmail.do",
			{ name:name,  phoneNumber:phoneNumber },
			function(data, status){
				alert(data);			
				self.close();
			}
		);
	});


	$('#userFindPwd').click(function(){ // 비밀번호 찾기 처리
		var email = $('#email').val();
		var name = $('#name').val();
		var phoneNumber = $('#phoneNumber').val();
		
		
		if (email == '') {
		alert("이메일을 입력해주세요.");
		return;
		}		
		if (name == '') {
		alert("이름을 입력해주세요.");
		return;
		}
		if (phoneNumber == '') {
		alert("전화번호를 입력해주세요.");
		return;
		}
				
		$.post("/user/userFindPwd.do",
			{ name:name, email:email, phoneNumber:phoneNumber },
			function(data, status){
				alert(data);		
				self.close();
			}
		);
	});	
});