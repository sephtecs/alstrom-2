<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String username = (String)session.getAttribute("username"); %>
<h2>You are logged in as : <%= username %> </h2>
<h1><a href="displayUserDetails.jsp">View All Users</a></h1>
<h1><a href="searchUser.jsp">Search Users</a></h1>

</body>
</html>