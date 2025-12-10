package com.dao;

import java.sql.*;
import java.util.*;
import com.entity.HoSoBenhAn;

public class HoSoBenhAnDAO {
    private Connection conn;

    public HoSoBenhAnDAO(Connection conn) {
        this.conn = conn;
    }

    // ➕ Thêm hồ sơ bệnh án
    public boolean addHoSoBA(HoSoBenhAn r) {
        boolean f = false;
        try {
            String sql = """
                INSERT INTO HoSoBenhAn 
                (CuocHenId, UserId, DoctorId, Symptoms, Diagnosis, Medicine, NextAppointment, PdfResult, CreatedAt) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE())
                """;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, r.getCuocHenId());
            ps.setInt(2, r.getUserId());
            ps.setInt(3, r.getDoctorId());
            ps.setString(4, r.getSymptoms());
            ps.setString(5, r.getDiagnosis());
            ps.setString(6, r.getMedicine());
            ps.setDate(7, new java.sql.Date(r.getNextAppointment().getTime()));
            ps.setString(8, r.getPdfResult());
            f = ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // 📄 Lấy danh sách hồ sơ theo bệnh nhân
    public List<HoSoBenhAn> getRecordsByUserId(int userId) {
        List<HoSoBenhAn> list = new ArrayList<>();
        try {
            String sql = """
                SELECT m.Id, m.Symptoms, m.Diagnosis, m.Medicine, 
                       m.NextAppointment, m.PdfResult, m.CreatedAt,
                       d.FullName AS DoctorName, c.ngayHen
                FROM HoSoBenhAn m
                JOIN Doctor d ON m.DoctorId = d.Id
                JOIN CuocHen c ON m.CuocHenId = c.Id
                WHERE m.UserId = ?
                ORDER BY m.CreatedAt DESC
                """;

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                HoSoBenhAn record = new HoSoBenhAn();
                record.setId(rs.getInt("Id"));
                record.setSymptoms(rs.getString("Symptoms"));
                record.setDiagnosis(rs.getString("Diagnosis"));
                record.setMedicine(rs.getString("Medicine"));
                record.setNextAppointment(rs.getDate("NextAppointment"));
                record.setPdfResult(rs.getString("PdfResult"));
                record.setCreatedAt(rs.getTimestamp("CreatedAt"));
                record.setDoctorName(rs.getString("DoctorName"));
                record.setAppointmentDate(rs.getString("ngayHen"));
                list.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
