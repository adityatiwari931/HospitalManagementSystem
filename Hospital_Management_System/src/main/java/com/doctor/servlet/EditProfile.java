package com.doctor.servlet;

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
@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			

			String fullname=request.getParameter("username");
			String dob=request.getParameter("dob");
			String qualification=request.getParameter("qualification");
			String specialist=request.getParameter("specialist");
			String email=request.getParameter("email");
			String mobno=request.getParameter("mobno");

			
			int id = Integer.parseInt(request.getParameter("id"));
			
			
			Doctor doctor=new Doctor(id,fullname, dob, qualification, specialist, email, mobno, "");
			
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			HttpSession session=request.getSession();
			
			if(dao.editDoctorProfileByDoctor(doctor)) {
				Doctor UpdateDoctor =  dao.getDoctorById(id);
				session.setAttribute("sucMsgd", "Profile Updated Successfully");
				session.setAttribute("doctObj", UpdateDoctor);
				response.sendRedirect("doctor/edit_profile.jsp");
			}else {
				session.setAttribute("errorMsgd", "Profile not updated");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
