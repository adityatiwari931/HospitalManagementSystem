package com.admin.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

/**
 * Servlet implementation class AddDoctor
 */
@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		
		String fullname=request.getParameter("username");
		String dob=request.getParameter("dob");
		String qualification=request.getParameter("qualification");
		String specialist=request.getParameter("specialist");
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		String password=request.getParameter("password");
		Doctor doctor=new Doctor(fullname, dob, qualification, specialist, email, mobno, password);
		
		DoctorDao dao=new DoctorDao(DBConnect.getConn());
		HttpSession session=request.getSession();
		
		if(dao.registerDoctor(doctor)) {
			session.setAttribute("sucMsg", "Doctor added Successfully");
			response.sendRedirect("admin/doctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Doctor not added");
			response.sendRedirect("admin/doctor.jsp");
		}
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	}

}