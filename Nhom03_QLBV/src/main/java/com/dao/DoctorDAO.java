package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDAO {
	private Connection conn;

	public DoctorDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addDoctor(Doctor d) {
		boolean f = false;

		try {
			String sql = " Insert into Doctor(FullName,Dob,Qualification,ChuyenKhoa,Email,MobNo,Password) values (?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getChuyenKhoa());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		try {
			String sql = "Select * From Doctor order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setChuyenKhoa(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Doctor getDoctorById(int id) {

		Doctor d = null;
		try {
			String sql = "Select * From Doctor where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setChuyenKhoa(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}

	public boolean updateDoctor(Doctor d) {
		boolean f = false;

		try {
			String sql = "Update Doctor Set FullName = ?, Dob = ?, Qualification = ?, ChuyenKhoa = ?, Email = ?, MobNo = ?, Password = ? Where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getChuyenKhoa());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteDoctor(int id) {
		boolean f = false;
		try {
			String sql = "Delete From Doctor Where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (SQLException e) {
			if (e.getMessage().contains("REFERENCE")) {
	            System.err.println("Không thể xóa bác sĩ vì còn lịch hẹn liên quan trong CuocHen.");
	        } else {
	            e.printStackTrace();
	        }
		}
		return f;
	}

	public Doctor login(String email, String password) {
		Doctor d = null;
		try {

			String sql = "Select * from doctor where email = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setChuyenKhoa(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return d;

	}
	public int countDoctor() {
		int count = 0;
		try {
			String sql = "select count(*) from doctor";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			
		}
		return count;
	}
	
	public int countCuocHen() {
		int count = 0;
		try {
			String sql = "select count(*) from CuocHen";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			
		}
		return count;
	}
	
	public int countUser() {
		int count = 0;
		try {
			String sql = "select count(*) from Users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			
		}
		return count;
	}
	
	public int countBacSiChuyenKhoa() {
		int count = 0;
		try {
			String sql = "select count(*)S from BacSiChuyenKhoa";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			
		}
		return count;
	}
	
	public int countCuocHenTheoId(int did) {
		int count = 0;
		try {
			String sql = "select count(*) from CuocHen where doctorId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			
		}
		return count;
	}
	
	public List<Doctor> getDoctorsByChuyenKhoaId(int chuyenKhoaId) {
	    List<Doctor> list = new ArrayList<>();

	    try {
	        String sql = "SELECT d.* FROM Doctor d "
	                   + "JOIN BacSiChuyenKhoa b "
	                   + "ON d.ChuyenKhoa COLLATE SQL_Latin1_General_CP1_CI_AI = "
	                   + "b.TenChuyenKhoa COLLATE SQL_Latin1_General_CP1_CI_AI "
	                   + "WHERE b.Id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, chuyenKhoaId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Doctor d = new Doctor();
	            d.setId(rs.getInt("Id"));
	            d.setFullName(rs.getString("FullName"));
	            d.setChuyenKhoa(rs.getString("ChuyenKhoa"));
	            d.setQualification(rs.getString("Qualification"));
	            d.setEmail(rs.getString("Email"));
	            d.setMobNo(rs.getString("MobNo"));
	            list.add(d);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public boolean checkOldPassword(int doctorId, String oldPassword) {
		boolean f = false ;
		
		try {
			String sql = "Select * from doctor where id = ? and password = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorId);
			ps.setString(2, oldPassword);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean changePassword(int doctorId, String newPassword) {
		boolean f = false ;
		
		try {
			String sql = "update doctor set password = ? where id = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, newPassword);
			ps.setInt(2, doctorId);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean editDoctorProfile(Doctor d) {
		boolean f = false;

		try {
			String sql = "Update Doctor Set FullName = ?, Dob = ?, Qualification = ?, ChuyenKhoa = ?, Email = ?, MobNo = ? Where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getChuyenKhoa());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setInt(7, d.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
}