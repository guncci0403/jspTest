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

<title>Signin Template for Bootstrap **</title>


<%@ include file="/common/common_lib.jsp"%>
<%-- common_lib.jsp의 내용을 지금 기술되는 부분에 코드를 복사해서 붙여 넣기 --%>

<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>


<!-- Custom styles for this template -->
<link href="<%=request.getContextPath() %>/css/signin.css" rel="stylesheet">

  <script>
  	function getCookieValue(cookieStr, cookieName){
  		console.log("getCookieValue");

  		//String[] cookies = cookieStr.split("; ");
  		var cookies = cookieStr.split("; ");
		
		//cookies[0] = userid=brown
		//cookies[1] = rememberme=Y
		//cookies[2] = test=testcookie
		
		//for(String cookieString : cookies) {
		for(var i in cookies) {
			//cookieString : 쿠키이름=쿠키값
			
			//String [] cookie = cookieString.split("=");
			var cookie = cookies[i].split("=");
			//cookie[0] = 쿠키이름
			//cookie[1] = 쿠키값
			
			//찾고자 하는 쿠키 이름인지 확인
			if(cookie[0] == (cookieName)) { //객체 비교는 == 이아니라 .equals로 한다.
				return cookie[1];
			}
		return "";
  		}
	}
		
	//cookieName : 추가하고자 하는 쿠키 이름
	//cookieValue : 쿠키의 값
	//expires : 유효기간(일수)
	function addCookie(cookieName, cookieValue, expires){
		var dt = new Date(); 	//지금현재 날짜 => expires 만큼 미래날짜로 변경
		dt.setDate( dt.getDate() + parseInt(expires));
		console.log(dt);
		
		document.cookie = cookieName + "=" + cookieValue + "; " + 
						  "path=/; expires=" + dt.toGMTString();
	}
	
  	function deleteCookie(cookieName){
  		addCookie(cookieName,"",-1);
  	}
  	
	//html 문서 로딩이 완료되고 나서 실행되는 코드 $(function(){}) => 순차적으로 실행되는 문제 해결
  	$(function(){
		//userid, rememberme 쿠키를 확인하여 존재할 경우 값설정, 체크
		if(Cookies.get("userid") != undefined){
			$("#userid").val(Cookies.get("userid"));
			$("#rememberme").prop("checked", true)
		}
		
		//signin 아이디를 select  		
		$("#signin").on("click", function(){
			//rememberme 체크박스가 체크 되어있는지 확인
			
			//체크 되어있을 경우
			if($("#rememberme").is(":checked")==true){
				//userid input에 있는 값을 userid쿠키로 저장
				Cookies.set("userid", $("#userid").val());
				
				//rememberme 쿠키로 Y 값을 저장
				Cookies.set("rememberme", "Y");
			}
			//체크 해제되어 있는 경우 : 더이상 사용하지 않는다는 의미 이므로 userid, rememberme 쿠키 삭제
			else{
				Cookies.remove("userid");
				Cookies.remove("rememberme");
			}
			// form태그를 이용하여 signin 요청
			$("#frm").submit();
		});
	});
		
/*	//brown
  	var cookieValue = getCookieValue(document.cookie, "userid"); //호출
  	console.log(cookieValue); */
  </script>

</head>
<body>

    <div class="container">

      <form class="form-signin" id="frm" action="<%= request.getContextPath() %>/loginController" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="userid" class="sr-only">userid</label>	<!-- label : 정렬을 깔끔하게, sr-only : -->
        <input type="text" id="userid" class="form-control" placeholder="사용자 아이디" required autofocus name="userid">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required value="brownpass" name="pass">
        <div class="checkbox">
          <label>
            <input type="checkbox" id="rememberme" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="button" id ="signin">Sign in</button>
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