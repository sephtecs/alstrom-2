<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Hello and welcome to JSP</h1>

<%! String guestName; %>

<% guestName = request.getParameter("gname"); 
	for (int i=1; i<=5; i++){
		%>
		<h1><%= guestName %></h1>
		<%
	}
	%>
	<% out.println("Welcome : " + guestName); %>
	<%= "Welcome :" + guestName %>


</body>
</html>