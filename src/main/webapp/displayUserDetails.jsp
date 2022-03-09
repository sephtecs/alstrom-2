<%@page import="java.util.List"%>
<%@page import="com.training.ers.dao.LoginDAO"%>
<%@page import="com.training.ers.dao.LoginDAOImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.training.ers.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<% String username = (String)session.getAttribute("username"); %>
<h2>You are logged in as : <%= username %> and the message is : <%= session.getAttribute("message") %></h2>

<body>

	<%
	LoginDAO loginDAO = new LoginDAOImpl();
	List<User> users = loginDAO.getUsers();
	Iterator<User> iterator = users.iterator();
	%>

	<h1>List of all the users</h1>

	<table border="2" cellspacing="10" cellpadding="10">
		<th>User Id</th>
		<th>User Name</th>
		<th>Password</th>
		<th>Gender</th>
		<th>Notifications</th>
		<th>Qualification</th>
		<%
		while (iterator.hasNext()) {
			User user = iterator.next();
		%>
		<tr>
			<td><%=user.getUserId()%></td>
			<td><%=user.getUsername()%></td>
			<td><%=user.getPassword()%></td>
			<td><%=user.getGender()%></td>
			<td><%=user.getNotifications()%></td>
			<td><%=user.getQualification()%></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>