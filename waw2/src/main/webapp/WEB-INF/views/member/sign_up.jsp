<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 가입 페이지</title>
  <link rel="stylesheet" href="${contextPath}/resources/css/sign_up.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	
	
	$(function(){
		
		
		const getEmailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);		
		const getPwdCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/); //영문 대소문자 숫자 특수문자 
		const getName= RegExp(/^[가-힣]+$/); //한글로만
		
		let checkEmail = false, checkNickname = false, checkPwd = false, checkPwdConfirm = false, checkName = false;
		
		$('#email').on('keyup', function(){
			console.log($(this).val());
			
			//공백확인
			if($('#email').val() == ""){				
				checkEmail = false;
				$('#email_msg').html('<p>이메일을 입력해주세요.</p>');
				
			} else if(!getEmailCheck.test($('#email').val())){								
				checkEmail = false;
				$('#email_msg').html('<p>잘못된 이메일 형식입니다.</p>');
			} else {
				const email = $('#email').val();
				$.ajax({
					type: "POST",
					url: "${contextPath}/member/emailCheck",
					headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
		            },
		            data: email,
		            datatype: "json",
		            success: function(data){
		            	console.log(data);
		            	if(data.confirm == "OK"){
		            		$('#email_msg').html('<p>사용가능한 이메일입니다.</p>');
		            		checkEmail = true;
		            	} else {
		            		
		            		checkEmail = false;
							$('#email_msg').html('<p>중복된 이메일이 존재합니다.</p>');
		            	}
		            },
		            error: function(error){
		            	console.log("error : " + error);
		            }
				});
			}
		});
		
		$('#nickname').on('keyup', function(){
			console.log($(this).val()); //값 콘솔에 출력
			
			//공백확인
			if($('#nickname').val() == ""){			
				checkNickname = false;
				$('#nickname_msg').html('<p>닉네임을 입력해주세요.</p>');
			
						
			//닉네임 중복확인 비동기 처리
			} else {
				const nickname = $('#nickname').val();
				$.ajax({
					type: "POST",
					url: "${contextPath}/member/nicknameCheck",
					headers: {
		                "Content-Type": "application/json; charset=utf-8",
		                "X-HTTP-Method-Override": "POST"
		            },
		            data: nickname,
		            datatype: "json",
		            success: function(data){
		            	console.log(data);
		            	if(data.confirm == "OK"){		            		
		            		checkNickname = true;
		            		$('#nickname_msg').html('<p>사용가능한 닉네임입니다.</p>');
		            	} else {		            		
		            		checkNickname = false;
							$('#nickname_msg').html('<p>중복된 닉네임이 존재합니다.</p>');
		            	}
		            },
		            error: function(error){
		            	console.log("error : " + error);
		            }
				});
			}
		});
		
		$('#pwd').on('keyup', function(){
			//비밀번호 공백 확인
			if($('#pwd').val() == "") {				
				checkPwd = false;
				$('#pwd_msg').html('<p>비밀번호를 입력해주세요.</p>');
			} else if(!getPwdCheck.test($("#pwd").val()) || $("#pwd").val().length < 8){				
				checkPwd = false;
				$('#pwd_msg').html('<p>비밀번호는 대소문자, 숫자, 특수문자를 조합해서 8자리이상으로 만들어주세요!</p>');
			}
			else {
				$('#pwd_msg').html('<p></p>');
				checkPwd = true;
			}
		});
		
		
		//비밀번호 확인 검증
		$('#pwd_check').on('keyup', function() {
	
			//비밀번호 확인란 공백 확인
			if($("#pwd_check").val() == ""){			
				checkPwdConfirm = false;
				$('#pwd_check_msg').html('<p>비밀번호 확인을 입력해주세요.</p>');
			}		         
			//비밀번호, 비밀번호 확인 일치
			else if($("#pwd").val() != $("#pwd_check").val()){			
				checkPwdConfirm = false;
				$('#pwd_check_msg').html('<p>비밀번호가 일치하지 않습니다.</p>');
			} else {				
				$('#pwd_check_msg').html('<p>비밀번호가 일치합니다.</p>');
				checkPwdConfirm = true;
			}
		});
		
		
		//이름 값 검증
		$('#name').on('keyup', function() {
			
			//이름값 공백 확인
			if($("#name").val() == ""){				
				checkName = false;
				$('#name_msg').html('<p>이름을 입력해주세요.</p>');
			} else if(!getName.test($("#name").val())){				
				checkName = false;
				$('#name_msg').html('<p>이름은 한글만 허용합니다.</p>');	         						
			} else {
				$('#name_msg').html('<p></p>');
				checkName = true;
			}
		});
		
		
		
		
			
		//회원 가입 요청 처리
		$('#join-btn-btn').click(function(e) {
			
			if(checkEmail && checkNickname && checkPwd && checkPwdConfirm && checkName) {
				//값을 객체에 담기
				const email = $('#email').val();
				const pwd = $('#pwd').val();
				const name = $('#name').val();
				const nickname = $('#nickname').val();
				
				//json객체에 담기
				const member = {
					email: email,					
					pwd: pwd,
					name: name,
					nickname: nickname														
				}
				//통신
				$.ajax({
					type: "POST",
					url: "${contextPath}/member/joinProcess",
					headers: {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST"
					},
					dataType: "text",
					data: JSON.stringify(member),
					success: function(result) {
						console.log("result : " + result);
						if(result == "joinSuccess"){
							alert("회원가입되었습니다. 로그인해서 접속해 주세요");
							self.close();
						}else {
							alert('입력정보를 다시 확인하세요.')
						}												 
					}
			
				}); //통신끝
			} else {
				alert('입력정보를 다시 확인하세요.')
			}
		
		
	});
	});
		
		</script>



</head>
<body>
  <div class="sign-up">
    <div class="main-body">
      <div class="login_container">
        <div class="form_container">
            <form name="login_form" action="${contextPath}/member/joinProcess" method="post">
                <div class="form_title_div">
                    <p class="form_title_p">WAW 회원 가입창</p>
                </div>                
                <div>
                    <div>
                        <input type="text" name="email" id="email" placeholder="이메일" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="email_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="password" name="pwd"  id="pwd"placeholder="비밀번호" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="pwd_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="password" name="pwd_check" id="pwd_check" placeholder="비밀번호 확인" class="form_input" />
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="pwd_check_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="text" name="name"  id="name" placeholder="이름" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="name_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="text" name="nickname" id="nickname" placeholder="닉네임" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="nickname_msg" class="form_text_alert"></div>
                    </div>
                </div>                                                
                <div style="height: 10px;"></div>
                <div>
                    <button type="button" class="form_submit_button" id="join-btn-btn">가입</button>
                </div>
            </form>
        </div>
    </div>
    <div class="msg-box" id="alert_msg"></div>
    <div class="sign-in">
      <div class="desc">
        계정이 있으신가요? &nbsp;
        <a href="/waw">로그인</a>
      </div>
    </div>
    </div>

  </div>
  <footer>
    <div class="team-intro">
      © 2021 WAW 팀 | 맹동현, 이승준, 장현호, 최민석
    </div>
  </footer>
</body>
</html>