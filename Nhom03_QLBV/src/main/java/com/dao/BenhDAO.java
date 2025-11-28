package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Benh;

public class BenhDAO {
	private Connection conn;

	public BenhDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public int getChuyenKhoaIdByTrieuChung(String trieuChung) {
	    int id = -1;
	    try {
	        String sql = "SELECT TOP 1 ChuyenKhoaId FROM Benh "
	                   + "WHERE (TrieuChung COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ? "
	                   + "OR TenBenh COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, "%" + trieuChung + "%");
	        ps.setString(2, "%" + trieuChung + "%");
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            id = rs.getInt("ChuyenKhoaId");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return id;
	}

	
	public List<Benh> getAllBenh() {
		List<Benh> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM Benh";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Benh b = new Benh();
				b.setId(rs.getInt("Id"));
				b.setTenBenh(rs.getString("TenBenh"));
				b.setTrieuChung(rs.getString("TrieuChung"));
				b.setChuyenKhoaId(rs.getInt("ChuyenKhoaId"));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
