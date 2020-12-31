<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Signin Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath() %>/css/signin.css" rel="stylesheet">

</head>
<body>

    <div class="container">

      <form class="form-signin" action="<%= request.getContextPath() %>/loginController" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="userid" class="sr-only">userid</label>	<!-- label : 정렬을 깔끔하게, sr-only : -->
        <input type="text" id="userid" class="form-control" placeholder="사용자 아이디" required autofocus name="userid" value="brown">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required value="brownpass" name="pass">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->


    
    
    
	<%-- 개인정보를 전송 하므로 url에 노출되지 않도록 request body 영역에 파라미터를 전송 ==> method="Post"--%>
<%-- 	<form action="<%= request.getContextPath() %>/loginController" method="post">  --%>
<!-- 	user id : <input type="text" name="userid" value="brown"/> <br> -->
<!-- <!-- 	user id : <input type="text" name="userid" value="sally"/> <br> -->
<!-- 	password : <input type="password" name="pass" value="qwe123"/> <br> -->
<!-- 	<input type="submit" value="전송"/> -->
<!-- 	</form> -->
</body> 
</html>