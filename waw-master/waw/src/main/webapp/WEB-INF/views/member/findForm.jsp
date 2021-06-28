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
  <title>email/password찾기</title>
  <link rel="stylesheet" href="${contextPath}/resources/css/sign_up.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	
	
	$(function(){
		
		
		let checkEmail = false, checkNickname = false, checkPwd = false, checkPwdConfirm = false, checkName = false,checkBirth = false, checkPhone = false;
		
		$('#findEmail_btn').click(function(){ // 아이디 찾기 처리
			const name = $('#name').val();
			const birth = $('#birth').val();
			const phone = $('#phone').val();
			
			const member = {
					
					name: name,				
					birth: birth,
					phone: phone					
				
				}
			
			if (name == '') {
			alert("이름을 입력하세요.");
			return;
			}
			if (phone == '') {
			alert("전화번호를 입력하세요.");
			return;
			}
			
			if (birth == '') {
			alert("생일을 입력하세요.");
			return;
			}
			
			$.ajax({
				type: "POST",
				url: "${contextPath}/member/findEmail",
				headers: {
					"Content-Type": "application/json; charset=utf-8",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: "text",
                data: JSON.stringify(member),
                success:function(data, status){
					alert(data);			
					self.close();
				}
			
		});

	});
	});
		
		</script>



</head>
<body>
  <div class="sign-up">
    <div class="main-body">
      <div class="login_container">
        <div class="form_container">        	
            <form name="login_form" method="post">
                <div class="form_title_div">
                    <p class="form_title_p">WAW EMAIL찾기</p>
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
                        <input type="text" name="birth" id="birth" placeholder="생일" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="birth_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="text" name="phone" id="phone" placeholder="전화번호" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="phone_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                </div>
                <div style="height: 10px;"></div>
                <div>
                    <button type="button" class="form_submit_button" id="findEmail_btn">EMAIL찾기</button>
                </div>
            </form>
            
            <form name="login_form" method="post">
                <div class="form_title_div">
                    <p class="form_title_p">WAW PASSWORD찾기</p>
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
                        <input type="text" name="name"  id="name" placeholder="이름" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="name_msg" class="form_text_alert"></div>
                    </div>
                </div>
                
                <div>
                    <div>
                        <input type="text" name="birth" id="birth" placeholder="생일" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="birth_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="text" name="phone" id="phone" placeholder="전화번호" class="form_input"/>
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="phone_msg" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                </div>
                <div style="height: 10px;"></div>
                <div>
                    <button type="button" class="form_submit_button" id="findPwd_btn">PASSWORD찾기</button>
                </div>
            </form>
                        
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