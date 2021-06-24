<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
  	<script src="${contextPath}/resources/js/command2.js"></script>
  	<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">  	
	
	<meta charset="UTF-8">
	<title>회원가입</title>
	
		    
</head>
<body>
	<div class="container">
	        <div class="row centered-form">
	        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
	        	<div class="panel panel-default">
	        		<div class="panel-heading">
				    		<h3 class="panel-title">회원가입</h3>
				 			</div>
				 			<div class="panel-body">
				    		<form action= "${contextPath}/user/registerForm" method="post">
				    		<div class="row">
			    				<div class="col-md-6">
				    					<div class="form-group">
				                <input type="text" name="email" id="email"  placeholder="이메일 입력">
				    					</div>
				    				</div>
				    			</div>
				    			<div class="row">
				    				<div class="col-md-6">
				    					<div class="form-group">
				                <input type="text" name="id" id="id" placeholder="아이디 입력">
				    					</div>
				    				</div>
				    			</div>		
				    			<div class="row">
				    				<div class="col-xs-6 col-sm-6 col-md-6">
				    					<div class="form-group">
				    						<input type="password" name="pwd" id="pwd"  placeholder="비밀번호 입력">
				    					</div>
				    				</div>			    			
				    			</div>
				    			<div class="row">
				    				<div class="col-xs-6 col-sm-6 col-md-6">
				    					<div class="form-group">
				    						<input type="password" name="pwd2" id="pwd2"  placeholder="비밀번호 확인">
				    					</div>
				    				</div>			    			
				    			</div>
				    				
				    			<div class="row">
				    				<div class="col-md-6">
				    					<div class="form-group">
				                <input type="text" name="name" id="name" placeholder="이름 입력">
				    					</div>
				    				</div>
				    			</div>
				    				    	
			    				    	
				    					
	    						<div class="row">
				    				<div class="col-md-6">
				    					<div class="form-group">
				                <input type="text" name="phoneNumber" id="phoneNumber"  placeholder="전화번호 입력" >
				    					</div>
				    				</div>
				    			</div>	
				    					    						    		
				    			<button type="submit" class="btn btn-md btn-danger" id="register">가입하기</button>
				    		
				    		</form>
				    	</div>
		    		</div>
	    		</div>
	    	</div>
	    </div>
	    
	  
		    
	</body>

</html>