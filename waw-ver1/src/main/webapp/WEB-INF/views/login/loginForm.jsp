<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Company</title>
 
    <!-- 반응형 웹 만들기 -->
    <!-- 1. 모바일용 css -->
    <link rel="stylesheet" href="/waw/resources/css/test1_2.css" media="(max-width:600px)">
 
    <!-- 2. 데스크탑용 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="/waw/resources/css/test1_1.css" media="(min-width:600px)">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
  <form method="get"   action="${contextPath}/waw/login/chatbotForm.do">
    <div id="page">
 
        <header>
            <div id="logo">
                <img src="/waw/resources/imgs/logo.png" alt="Logo">
            </div>
 
            <div id="top_menu">
                <a href="#">HOME</a> | 
                <a href="#">NOTICE</a> |
<!--                 <a href="#">LOGIN</a> | -->
                <a href="#">JOIN</a> | 
                
                ID <input class="login" name="id" id="id"> PW <input type="password" class="login" name="pwd" id="pwd"> <input type="submit" value="LOGIN" >
               
            </div>
 
            <nav>
                <ul>
                    <li><a href="#">COMPANY</a></li>
                    <li><a href="#">PRODUCT</a></li>
                    <li><a href="#">CUSTOMER</a></li>
                    <li><a href="#">SERVICE</a></li>
                    <li><a href="#">RECRUIT</a></li>
                </ul>
            </nav>
 
        </header>
 
        <article id="content">
            <section id="main">
                <img id="main_img" src="/waw/resources/imgs/main_img.png" alt="main img" >
            </section>
            <section>
                <ul id="banner">
                    <li><a href="#"><img src="/waw/resources/imgs/banner1.png" alt="banner1"></a></li>
                    <li><a href="#"><img src="/waw/resources/imgs/banner2.png" alt="banner2"></a></li>
                </ul>
 
            </section>
            <section>
            	<div th:text="${message}"></div>
            </section>
 
        </article>
 
        <footer>
            <img id="address_img" src="/waw/resources/imgs/address.png" alt="address">
        </footer>
 
    </div>
   </form> 
</body>
</html>