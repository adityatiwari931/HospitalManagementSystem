package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("user_email");
			String password = req.getParameter("user_password");
			
			HttpSession session = req.getSession();
			
			UserDao dao = new UserDao(DBConnect.getConn());
			
			User user = dao.login(email, password);
			
			if(user!=null)
			{
				session.setAttribute("userObj", user);
				resp.sendRedirect("index.jsp");
			}else {
				session.setAttribute("errorMsg","invalid email & password");
				resp.sendRedirect("user_login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
