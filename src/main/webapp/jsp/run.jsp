<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		if( 1 == 1 ){
			throw new RuntimeException();
		}
	%>
	<!-- RuntimeException() 을 발생시키면 하위 코드 부터는 모두 에러로 처리된다.  -->
</body>
</html>