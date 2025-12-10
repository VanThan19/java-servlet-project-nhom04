package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.UserProfile;

public class UserProfileDAO {
	private Connection conn;

    public UserProfileDAO(Connection conn) {
        this.conn = conn;
    }

    public UserProfile getProfileByUserId(int userId) {
        UserProfile profile = null;
        try {
            String sql = "SELECT * FROM UserProfile WHERE UserId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                profile = new UserProfile();
                profile.setId(rs.getInt("Id"));
                profile.setUserId(rs.getInt("UserId"));
                profile.setGender(rs.getString("Gender"));
                profile.setDob(rs.getDate("Dob"));
                profile.setPhone(rs.getString("Phone"));
                profile.setAddress(rs.getString("Address"));
                profile.setInsuranceNumber(rs.getString("InsuranceNumber"));
                profile.setAvatar(rs.getString("Avatar"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return profile;
    }

    public boolean updateProfile(UserProfile p) {
        try {
            String sql = "UPDATE UserProfile SET Gender=?, Dob=?, Phone=?, Address=?, InsuranceNumber=? WHERE UserId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getGender());
            ps.setDate(2, new java.sql.Date(p.getDob().getTime()));
            ps.setString(3, p.getPhone());
            ps.setString(4, p.getAddress());
            ps.setString(5, p.getInsuranceNumber());
            ps.setInt(6, p.getUserId());

            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateAvatar(int userId, String avatarPath) {
        try {
            String sql = "UPDATE UserProfile SET Avatar=? WHERE UserId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, avatarPath);
            ps.setInt(2, userId);

            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
