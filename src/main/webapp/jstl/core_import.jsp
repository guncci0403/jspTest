<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="https://search.naver.com/search.naver">
		<c:param name="query" value="코로나"/>
	</c:import>
	<!-- 구글은 동일한 방법으로 안된다. 보안으로 막아놈 -->
	
</body>
</html>