<%@page import="sist.com.dao.MemberDao"%>
<%@page import="sist.com.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>

<%
String id = request.getParameter("username");
String pw = request.getParameter("psw");
String checker= MemberDao.pwCheck(id);
System.out.println(checker);
if(checker.equals(pw)){
	response.sendRedirect("listBoard.jsp?id="+id);
	System.out.println("로그인성공");
	return;
}
	response.sendRedirect("listBoard.jsp");
%>
</head>
<body>
</body>
</html>