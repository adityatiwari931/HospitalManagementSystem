package com.doctor.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String email = req.getParameter("doctor_email");
			String password = req.getParameter("doctor_password");
			
			HttpSession session = req.getSession();
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			
			Doctor doctor = dao.doctorLogin(email, password);
			
			if(doctor!=null)
			{
				session.setAttribute("doctObj", doctor);
				resp.sendRedirect("doctor/index.jsp");
			}else {
				session.setAttribute("errorMsg","invalid email & password");
				resp.sendRedirect("doctor_login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
