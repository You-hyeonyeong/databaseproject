<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>FIND EAT</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID")!= null){
		userID = (String) session.getAttribute("userID");
	}
	
	%>
	<nav class="navbar navbar-default" name="category">
		<div class="navbar=header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">FIND EAT</a>

		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li class="active"><a href="index.jsp">맛집리스트</a>
				<li>
			</ul>
			<%
				/*로그인이 되어 있지 않다면*/
				if(userID == null) {
					
			%>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<% 
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	
<div class="container">
	<div class="row">
	<form method="post" action="writeAction.jsp">
		<table class="table table-striped" style="text-align: center; border: 1px solid #FFCD28">
			<thead>
				<tr>
					<th style="background-color : #FFF978; text-align :center;">음식점 등록 양식</th>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="업소명" name="m_name" maxlenth="50"></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" placeholder="음식종류" name="m_kind" maxlenth="50"></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" placeholder="위치" name="m_address" maxlenth="50"></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" placeholder="영업시간" name="m_time" maxlenth="50"></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" placeholder="전화번호" name="m_tele" maxlenth="50"></td>
				</tr>
				
			</tbody>
		</table>
		<input type="submit" href="write.jsp" class="btn btn-primary pull-right" value="등록">
	</form>
	</div>
</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>