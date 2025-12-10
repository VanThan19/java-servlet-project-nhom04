package com.dao;
import java.sql.*;
import java.util.*;

import com.conn.DBConnect;

public class ThongKeDAO {
    private Connection conn;

    public ThongKeDAO(Connection conn) {
        this.conn = conn;
    }

    
    public int getTongBenhNhan() {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM Users");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

 
    public int getTongBacSi() {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM Doctor");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

 
    public int getTongCuocHen() {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM CuocHen");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    
    public Map<String, Integer> getTopBacSi() {
        Map<String, Integer> map = new LinkedHashMap<>();
        try {
            String sql = "SELECT d.fullName, COUNT(c.id) AS soLuong "
                       + "FROM CuocHen c JOIN Doctor d ON c.doctorId = d.id "
                       + "GROUP BY d.fullName ORDER BY soLuong DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                map.put(rs.getString("fullName"), rs.getInt("soLuong"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return map;
    }


    public Map<String, Integer> getBenhNhanTheoThang() {
        Map<String, Integer> map = new LinkedHashMap<>();
        try {
            String sql = "SELECT MONTH(ngayHen) AS Thang, COUNT(*) AS SoBenhNhan "
                       + "FROM CuocHen GROUP BY MONTH(ngayHen) ORDER BY Thang";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                map.put("Tháng " + rs.getInt("Thang"), rs.getInt("SoBenhNhan"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return map;
    }
    public int getCuocHenHomNay() {
        try {
            String sql = "SELECT COUNT(*) FROM CuocHen WHERE CAST(ngayHen AS DATE) = CAST(GETDATE() AS DATE)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}