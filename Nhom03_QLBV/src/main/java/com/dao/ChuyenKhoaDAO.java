package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BacSiChuyenKhoa;


public class ChuyenKhoaDAO {
	private Connection conn;

	public ChuyenKhoaDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean ThemChuyenKhoa(String chuyenKhoa) {
		boolean f = false ;
		
		try {
			String sql = "Insert into BacSiChuyenKhoa(TenChuyenKhoa) values (?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, chuyenKhoa);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<BacSiChuyenKhoa> getAllSpec() {
		List<BacSiChuyenKhoa> list = new ArrayList<BacSiChuyenKhoa>();
		BacSiChuyenKhoa ck = null;
		
		try {
			String sql = "Select * from BacSiChuyenKhoa";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ck = new BacSiChuyenKhoa();
				ck.setId(rs.getInt(1));
				ck.setTenChuyenKhoa(rs.getString(2));
				list.add(ck);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
