<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<script src="<c:url value='resources/js/home.js'/>"></script>
  <link rel="stylesheet" href="resources/css/home.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
    
    $(function(){
    	
        
        let checkEmail = false, checkPwd = false;
        
        $('#email').on('keyup', function(){
            if($('#email').val() == "") {
                checkEmail = false;
            } else {
            	checkEmail = true;
            }
        });
        $('#pwd').on('keyup', function(){
            if($('#pwd').val() == "") {
            	checkPwd = false;
            } else {
            	checkPwd = true;
            }
        });
        //로그인 버튼 클릭 이벤트
        $('#login-btn').click(function(e) {
            if(checkEmail && checkPwd) {
                const email = $('#email').val();
                const pwd = $('#pwd').val();
                //콘솔에 값 출력
                console.log("email: " + email);
                console.log("pwd: " + pwd);
                
                const login = {
                    email: email,
                    pwd: pwd
                };
                $.ajax({
                    type: "POST",
                    url: "${contextPath}/member/loginCheck",
                    headers: {
                        "Content-Type": "application/json; charset=utf8",
                        "X-HTTP-Method-Override": "POST"
                    },
                    dataType: "text",
                    data: JSON.stringify(login),                   
                    success: function(result) {
                        console.log("result:" + result);                                               
                        if (result == "loginSuccess") {
                            alert("로그인성공!");
                            self.location="${contextPath}/chatbot";
                        } else {
                        	alert("비밀번호가 틀렸습니다.");
                        	self.location="${contextPath}/"
                        }
                    }
                }); //ajax끝
            } else {
                alert('입력 정보를 다시 확인하세요');
                self.location = "${contextPath}/";
            }
        });
        $('#pwd').keydown(function(key){
            //엔터키 코드 13
            if(key.keyCode == 13) {
                $('#login-btn').click();
            }
        });
    });
</script>
  
  <title>메인 로그인 페이지</title>
	
</head>
<body>
  <div class="main-body">
    <div class="left-body">
      <div class="intro-name">
        👨🏼‍🤝‍👨🏻 WAW  
        <div class="intro-name-desc">
          We Are the World!!, Where Are We now!!
        </div>
        <div class="intro-project-desc">
        </div>
      </div>   
    </div>
    <div class="right-body">
      <div class="login_container">
        <div class="form_container">
            <form action="${contextPath}/member/loginCheck" method="post">
                <div class="form_title_div">
                    <p class="form_title_p">WAW</p>
                </div>
                <div>
                    <div class="form_text_alert_padding">
                        <div id="alert_username" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="text" name="email" id="email" placeholder="email" class="form_input" />
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="alert_email" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <input type="password" name="pwd" id="pwd" placeholder="비밀번호" class="form_input"  />
                    </div>
                    <div class="form_text_alert_padding">
                        <div id="alert_password" class="form_text_alert"></div>
                    </div>
                </div>
                <div>
                </div>
                <div style="height: 10px;"></div>
                <div>
                    <button type="button" id="login-btn" class="form_submit_button">로그인</button>
                </div>
            </form>
        </div>
    </div>
    <div class="sign-up">
      <div class="desc">
        계정이 없으신가요? &nbsp;
        <button class="form_submit_button" onclick="window.open('member/join.do', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=750');">가입하기</button>
		<button class="form_submit_button" onclick="window.open('member/find.do', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=750');">ID/PW 찾기</button>
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
