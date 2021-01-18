<%@page import="kr.or.ddit.common.model.PageVo"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Jsp</title>

<%@ include file="/common/common_lib.jsp"%>

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/dashboard.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/blog.css" rel="stylesheet">

<script>
/* 	사용자 수정 : mehtod : get action = /userModify
	사용자 삭제 : mehtod : post action = /deleteUser
	파라미터는 둘다 userid 하나만 있으면 가능 */
//문서 로딩이 완료 되었을 때
$(function(){
	//get 방식 post방식 차이 구분 하는법 => 서버에 변경이 없이 화면에 조회만 하는것이면 get방식을 쓰는데
	//아래 userModify는 수정하는 페이지 진입이라 조회만 하는거고 그 안에서 수정 버튼이 post
	$("#modifyBtn").on("click", function() {
		$("#frm").attr("method", "get");
		$("#frm").attr("action", "${pageContext.request.contextPath }/userModify");
		$("#frm").submit();
	});
	$("#deleteBtn").on("click", function() {
		$("#frm").attr("method", "post");
		$("#frm").attr("action", "${pageContext.request.contextPath }/deleteUser");
		$("#frm").submit();
	});
})
</script>
</head>

<body>
	
	
	<%@ include file="/common/header.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
				<%@ include file="/common/left.jsp"%>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				
				<% UserVo user = (UserVo)request.getAttribute("user"); %>
				
				<form class="form-horizontal" id="frm" role="form">
					<input type="hidden" name="userid" value="<%=user.getUserid() %>"/>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">사용자 사진</label>
						<div class="col-sm-10">
							<img src="${pageContext.request.contextPath }/profile/<%=user.getUserid()%>.png"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getUserid() %></label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">사용자 이름</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getUsernm() %></label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">별명</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getAlias() %></label>
						</div>
					</div>
		

					<div class="form-group">
						<label class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<label class="control-label">******</label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">등록일시</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getReg_dt_fmt() %></label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">도로주소</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getAddr1() %></label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getAddr2() %></label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getZipcode() %></label>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<!-- 사용자 수정 : mehtod : get action = /userModify
							사용자 삭제 : mehtod : post action = /deleteUser
							파라미터는 둘다 userid 하나만 있으면 가능 -->
							<button type="submit" id="modifyBtn" class="btn btn-default">사용자 수정</button>
							<button type="submit" id="deleteBtn" class="btn btn-default">사용자 삭제</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>