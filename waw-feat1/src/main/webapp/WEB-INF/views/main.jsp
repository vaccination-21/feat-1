<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	
  	<meta charset="utf-8">
  
	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	  	
  	<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">	  	
 <title>메인</title>
	<script>	
	$(document).ready(function(){
		$("#btnLogin").click(function(){			
			var _id = $("id").val();
			var _pwd = $("#pwd").val();
			if(_id == ""){
				alert("아이디를 입력하세요.");
				$("#id").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if(_pwd == ""){
				alert("아이디를 입력하세요.");
				$("#pwd").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action="${contextPath}/user/loginCheck.do"
			// 제출
			document.form1.submit();
		});
	});
	</script>
</head>
<h2>로그인</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="userId" id="userId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw" id="userPw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
				<c:if test="${msg == 'fail'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${param.msg == 'nologin'}">
					<div style="color: red">
						로그인 후 사용이 가능합니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
			<form>
				<button class="btn btn-sm btn-danger"onclick="window.open('/registerForm.do', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=500');">회원가입</button>
				<button class="btn btn-sm btn-danger"onclick="window.open('/userFindForm.do', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=750');">email/PW 찾기</button>
				<button class="btn btn-sm btn-danger"onclick="window.open('#', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=750');">네이버로 로그인하기</button>					
			</form>
	
</html>