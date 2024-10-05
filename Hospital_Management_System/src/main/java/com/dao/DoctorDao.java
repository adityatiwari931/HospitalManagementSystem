package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.CatchTag;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerDoctor(Doctor d) {
		boolean f = false;
		try {

			String sql = "insert into doctor(username, dob, qualification, specialist, email, mobno, password)values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getUsername());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	public List<Doctor> getAllDoctors() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		try {
			String sql = "select * from doctor order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setUsername(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	public Doctor getDoctorById(int id) {

		Doctor d = null;
		try {
			String sql = "select * from doctor where id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setUsername(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return d;
	}
	
	public boolean updateDoctor(Doctor d) {
		boolean f = false;
		try {

			String sql = "update doctor set username=?, dob=?, qualification=?, specialist=?, email=?, mobno=?, password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, d.getUsername());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassword());
			ps.setInt(8,d.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	public boolean deleteDoctor(int id) {
		
		boolean f = false;
		
		try{
			
			String sql = "delete from doctor where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public Doctor doctorLogin(String email,String psw) {
		Doctor doctor = null;
		
		try {
			
			String sql = "select * from doctor where email=? and password=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2,psw);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				doctor = new Doctor();
				doctor.setId(rs.getInt(1));
				doctor.setUsername(rs.getString(2));
				doctor.setDob(rs.getString(3));
				doctor.setQualification(rs.getString(4));
				doctor.setSpecialist(rs.getString(5));
				doctor.setEmail(rs.getString(6));
				doctor.setMobno(rs.getString(7));
				doctor.setPassword(rs.getString(8));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return doctor;
	}

	public int countDoctor() {
		int count =0;
		
		try {
			String sql = "select * from doctor";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	public int countAppointment() {
		int count =0;
		
		try {
			String sql = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int countSpecialist() {
		int count =0;
		
		try {
			String sql = "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int countUser() {
		int count =0;
		
		try {
			String sql = "select * from user";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int countAppointmentByDoctorId(int did) {
		int count =0;
		
		try {
			String sql = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,did);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public boolean checkoldpassword(int userid,String oldPassword) {
		boolean f = false;
		
		try {
			String sql = "select * from doctor where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,userid);
			ps.setString(2,oldPassword);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				f=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean changeOldpassword(int userid,String newPasswrd) {
		boolean f = false;
		
		try {
			String sql = "update doctor set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,newPasswrd);
			ps.setInt(2,userid);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean editDoctorProfileByDoctor(Doctor d) {
		boolean f = false;
		try {

			String sql = "update doctor set username=?, dob=?, qualification=?, specialist=?, email=?, mobno=?  where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, d.getUsername());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setInt(7,d.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}
}