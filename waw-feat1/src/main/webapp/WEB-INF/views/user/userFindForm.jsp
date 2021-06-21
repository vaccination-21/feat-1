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
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/resources/jquery/jquery.min.js"></script>
  	<script src="${contextPath}/resources/js/command.js"></script>
  	<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

<title>아이디 비밀번호 찾기</title>
</head>
<body>
 	<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title"> 이메일찾기 </h3>
			 			</div>
			 			<div class="panel-body">
			    		<form method="post">
			    		<div class="row">
		    				<div class="row">
			    				<div class="col-md-6">
			    					<div class="form-group">
			                <input type="text" name="userName" id="name" class="form-control input-sm" placeholder="이름 입력">
			    					</div>
			    				</div>
			    			</div>
							
							<div class="row">
			    				<div class="col-md-6">
			    					<div class="form-group">
			                <input type="text" name="userPhone" id="phoneNumber" class="form-control input-sm" placeholder="전화번호 입력" />
			    					</div>
			    				</div>
			    			</div>	
			    			
		    				
			    			
			    			<input type="submit" id="userFindEmail" value="아이디 찾기" class="btn btn-info btn-block">
			    		
			    		</form>
			    	</div>
    			</div>
    		
        		<div class="panel panel-default">
			    	<div class="panel-heading">
			    		<h3 class="panel-title">비밀번호찾기</h3>
			 			</div>
			 			<div class="panel-body">
			    		<form method="post">
			    		<div class="row">
		    				<div class="col-md-6">
			    					<div class="form-group">
			                <input type="text" name="userEmail" id="email" class="form-control input-sm" placeholder="이메일 입력">
			    					</div>
			    				</div>
			    			</div>		
			    			
			    			<div class="row">
			    				<div class="col-md-6">
			    					<div class="form-group">
			                <input type="text" name="userName" id="name" class="form-control input-sm" placeholder="이름 입력">
			    					</div>
			    				</div>
			    			</div>	
	    					<div class="row">
			    				<div class="col-md-6">
			    					<div class="form-group">
			                <input type="text" name="userPhone" id="phoneNumber" class="form-control input-sm" placeholder="전화번호 입력" />
			    					</div>
			    				</div>
			    			</div>	
			    						    													    				    			    					    	
			    			<input type="submit" id="userFindPwd" value="비밀번호 찾기" class="btn btn-info btn-block">
			    		
			    		</form>
			    	</div>
			    	
	    		</div>
    		</div>
    	</div>
    </div>
    
</body>
</html>
