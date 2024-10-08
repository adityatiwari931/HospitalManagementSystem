package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int did = Integer.parseInt(req.getParameter("uid"));
			String oldPassword = req.getParameter("oldPassword");
			String newPassword = req.getParameter("newPassword");
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession  session = req.getSession();
			
			if(dao.checkoldpassword(did, oldPassword)) {
				if(dao.changeOldpassword(did, newPassword)) {
					session.setAttribute("sucMsg", "Password Changed Successfully");
					resp.sendRedirect("doctor/edit_profile.jsp");
				}
				else {
					session.setAttribute("errorMsg", "Something wrong on Server");
					resp.sendRedirect("doctor/edit_profile.jsp");
				}
			}else {
				session.setAttribute("errorMsg", "Incorrect Old Password");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
