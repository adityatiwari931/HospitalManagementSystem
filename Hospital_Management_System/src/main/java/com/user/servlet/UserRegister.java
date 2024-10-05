package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;


import jakarta.servlet.annotation.WebServlet;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		super.doPost(req, resp);
		
		try {
			
			String username = req.getParameter("user_name");
			String email = req.getParameter("user_email");
			String password = req.getParameter("user_password");
			
			User u = new User(username,email,password);
			
			UserDao dao = new UserDao(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			boolean f = dao.register(u);
			
			if(f) {
				
				session.setAttribute("sucMsg", "Register Successfully");
				resp.sendRedirect("signup.jsp");
			}
			else {

				session.setAttribute("errorMsg", "Something went wrong on server");
				resp.sendRedirect("signup.jsp");
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
