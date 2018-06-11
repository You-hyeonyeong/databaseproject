<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
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
	//System.out.println("값은 넘어가는거네ss"+ m_number);
	int m_number = 0;
	if (request.getParameter("m_number") != null) {
		m_number = Integer.parseInt(request.getParameter("m_number"));
	}
	if(m_number == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.herf = 'board.jsp'");
		script.println("</script>");
	}
	Board board = new BoardDAO().getBoard(m_number);
	System.out.println("값은 넘어가는거네"+ m_number);
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
		<table class="table table-striped" style="text-align: center; border: 1px solid #FFCD28">
			<thead>
				<tr>
					<th style="background-color : #FFF978; text-align :center;">음식점 글 보기</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:max-;">음식점 이름</td>
					<td colspan="2"><%= board.getM_name() %></td>
				</tr>
				<tr>
					<td>종류</td>
					<td colspan="2"><%= board.getM_kind() %></td>
				</tr>
				<tr>
					<td>위치</td>
					<td colspan="2"><%= board.getM_address() %></td>
				</tr>
				<tr>
					<td>영업시간</td>
					<td colspan="2"><%= board.getM_time() %></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td colspan="2"><%= board.getM_tele() %></td>
				</tr>
			</tbody>
		</table>
		<a href="board.jsp" class="btn btn-primary">목록보기</a>
		<input type="submit" href="write.jsp" class="btn btn-primary pull-right" value="글쓰기">
	
	</div>
</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>