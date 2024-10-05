package com.doctor.servlet;

import java.io.IOException;

import com.dao.Appointmentdao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comm = req.getParameter("comm");
			
			Appointmentdao dao = new Appointmentdao(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			if(dao.updateCommnetStatus(id, did, comm)) {
				session.setAttribute("sucMsg", "Comment Updated");
				resp.sendRedirect("doctor/pateint.jsp");
			}else {
				session.setAttribute("errorMsg", "Something went wrong on server");
				resp.sendRedirect("doctor/pateint.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
