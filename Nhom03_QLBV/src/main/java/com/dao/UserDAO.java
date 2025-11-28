package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Users;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean UsersRegister(Users users) {
		boolean f = false ;
		
		try {
			String sql = "Insert into Users (fullName,email,password) values (?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, users.getFullName());
			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPassword());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public Users login(String em, String psw) {
		Users u = null;
		
		try {
			String sql = "Select * from users where email=? and password =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				u = new Users();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

}
