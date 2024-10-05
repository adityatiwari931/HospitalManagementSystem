package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String fullname=request.getParameter("username");
			String dob=request.getParameter("dob");
			String qualification=request.getParameter("qualification");
			String specialist=request.getParameter("specialist");
			String email=request.getParameter("email");
			String mobno=request.getParameter("mobno");
			String password=request.getParameter("password");
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			
			Doctor doctor=new Doctor(id,fullname, dob, qualification, specialist, email, mobno, password);
			
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			HttpSession session=request.getSession();
			
			if(dao.updateDoctor(doctor)) {
				session.setAttribute("sucMsg", "Doctor Updated Successfully");
				response.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("errorMsg", "Profile not updated");
				response.sendRedirect("admin/doctor.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
