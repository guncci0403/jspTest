<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스코프객체.getAttribute("속성명"), 반환타입 : Object -->
	sumResult : <%= session.getAttribute("sumResult") %>
</body>
</html>