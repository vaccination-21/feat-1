<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	
	
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">	 	
 <title>메인</title>

</head>
<body>

  <!-- Navigation -->
  
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3 my-4">
			<div id="loginDiv" align="center">
	
        	<form id='loginForm' method='post'>        		
        	<table>
         		<tr>		
				<td><input type="text" id="id"  placeholder="이메일 입력" autofocus tabindex="1"> </td>
				<td rowspan="2"><button type="submit" class="btn btn-md btn-danger" id="login">로그인</button> </td>
				</tr>
				<tr>
				<td><input type="password" id="pwd"  placeholder="비밀번호 입력" autofocus tabindex="2"></td>
				
			</table>
			<br>
				<button class="btn btn-sm btn-danger"onclick="window.open('user/registerForm.do', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=500');">회원가입</button>
				<button class="btn btn-sm btn-danger"onclick="window.open('user/userFindForm.do', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=750');">email/PW 찾기</button>
				<button class="btn btn-sm btn-danger"onclick="window.open('#', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=500,height=750');">네이버로 로그인하기</button>	
			</form>
			</div>
			
  <script src="${contextPath}/resources/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/command.js"></script>
  <script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
  
	
  
</body>
	
	
</html>