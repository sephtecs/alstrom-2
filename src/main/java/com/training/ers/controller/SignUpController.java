package com.training.ers.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.training.ers.dao.LoginDAO;
import com.training.ers.dao.LoginDAOImpl;
import com.training.ers.model.User;

/**
 * Servlet implementation class SignUpController
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		// The values on the right of these strings are the same values in the User Model.
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String gender = request.getParameter("gender");
		String notification[] = request.getParameterValues("notification");
		String qualification = request.getParameter("qualification");
		String finalNotification="";
		
		//looping through an array of multiple selected check-boxes
		for(String temp:notification) {
			finalNotification += temp + ":";
		}
		
		//The Values in user should match the amount of values that's in the Strings we created above
		User user = new User(-1, username, password, gender, finalNotification, qualification);
		
		//DB CALL
		LoginDAO loginDAO = new LoginDAOImpl();
		loginDAO.register(user);
		
	
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		out.println("<html><body>");
		out.println("Welcome " + username);
		out.println("You are registered succesfully and your password is :" + password);
		out.println("<h1><a href=login.html>Login</a>");
		out.println(user);
		out.println("</body></html>");
	}

}
