package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.CuocHen;

public class CuocHenDAO {
	private Connection conn;

	public CuocHenDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addCuocHen(CuocHen h) {
		boolean f = false;
		
		try {
			String sql = "Insert into CuocHen (userId,fullName,gioiTinh,age,ngayHen,email,sdt,benhTat,doctorId,diaChi,trangThai)"
					+ " values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, h.getUserId());
			ps.setString(2, h.getFullName());
			ps.setString(3, h.getGioiTinh());
			ps.setString(4, h.getAge());
			ps.setString(5, h.getNgayHen());
			ps.setString(6, h.getEmail());
			ps.setString(7, h.getSdt());
			ps.setString(8, h.getBenhTat());
			ps.setInt(9, h.getDoctorId());
			ps.setString(10, h.getDiaChi());
			ps.setString(11, h.getTrangThai());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public List<CuocHen> getAllCuocHenByUserLogin(int userId) {
		List<CuocHen> list = new ArrayList<CuocHen>();
		CuocHen h = null;
		try {
			String sql = "Select * From CuocHen where userId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				h = new CuocHen();
				h.setId(rs.getInt(1));
				h.setUserId(rs.getInt(2));
				h.setFullName(rs.getString(3));
				h.setGioiTinh(rs.getString(4));
				h.setAge(rs.getString(5));
				h.setNgayHen(rs.getString(6));
				h.setEmail(rs.getString(7));
				h.setSdt(rs.getString(8));
				h.setBenhTat(rs.getString(9));
				h.setDoctorId(rs.getInt(10));
				h.setDiaChi(rs.getString(11));
				h.setTrangThai(rs.getString(12));
				list.add(h);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<CuocHen> getAllCuocHenByDoctorLogin(int doctorId) {
		List<CuocHen> list = new ArrayList<CuocHen>();
		CuocHen h = null;
		try {
			String sql = "Select * From CuocHen where doctorId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				h = new CuocHen();
				h.setId(rs.getInt(1));
				h.setUserId(rs.getInt(2));
				h.setFullName(rs.getString(3));
				h.setGioiTinh(rs.getString(4));
				h.setAge(rs.getString(5));
				h.setNgayHen(rs.getString(6));
				h.setEmail(rs.getString(7));
				h.setSdt(rs.getString(8));
				h.setBenhTat(rs.getString(9));
				h.setDoctorId(rs.getInt(10));
				h.setDiaChi(rs.getString(11));
				h.setTrangThai(rs.getString(12));
				list.add(h);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public CuocHen getCuocHenById(int id) {
		CuocHen h = null;
		try {
			String sql = "Select * From CuocHen where Id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				h = new CuocHen();
				h.setId(rs.getInt(1));
				h.setUserId(rs.getInt(2));
				h.setFullName(rs.getString(3));
				h.setGioiTinh(rs.getString(4));
				h.setAge(rs.getString(5));
				h.setNgayHen(rs.getString(6));
				h.setEmail(rs.getString(7));
				h.setSdt(rs.getString(8));
				h.setBenhTat(rs.getString(9));
				h.setDoctorId(rs.getInt(10));
				h.setDiaChi(rs.getString(11));
				h.setTrangThai(rs.getString(12));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return h;
	}
	public boolean updateCommentStatus(int id, int doctId,String comm) {
		boolean f = false;
		try {
			String sql = "update CuocHen set TrangThai = ? where id = ? and doctorId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctId);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<CuocHen> getAllCuocHen() {
		List<CuocHen> list = new ArrayList<CuocHen>();
		CuocHen h = null;
		try {
			String sql = "Select * From CuocHen order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				h = new CuocHen();
				h.setId(rs.getInt(1));
				h.setUserId(rs.getInt(2));
				h.setFullName(rs.getString(3));
				h.setGioiTinh(rs.getString(4));
				h.setAge(rs.getString(5));
				h.setNgayHen(rs.getString(6));
				h.setEmail(rs.getString(7));
				h.setSdt(rs.getString(8));
				h.setBenhTat(rs.getString(9));
				h.setDoctorId(rs.getInt(10));
				h.setDiaChi(rs.getString(11));
				h.setTrangThai(rs.getString(12));
				list.add(h);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
