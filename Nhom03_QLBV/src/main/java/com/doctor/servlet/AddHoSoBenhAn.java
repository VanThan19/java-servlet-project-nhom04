package com.doctor.servlet;

import java.io.*;
import java.nio.file.Paths;
import java.sql.Connection;
import java.util.Date;

import com.conn.DBConnect;
import com.dao.CuocHenDAO;
import com.dao.HoSoBenhAnDAO;
import com.entity.HoSoBenhAn;

import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addHoSoBenhAn")
@MultipartConfig
public class AddHoSoBenhAn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {
            // 🩺 Lấy dữ liệu từ form
            int cuocHenId = Integer.parseInt(req.getParameter("cuocHenId"));
            int userId = Integer.parseInt(req.getParameter("userId"));
            int doctorId = Integer.parseInt(req.getParameter("doctorId"));
            String symptoms = req.getParameter("symptoms");
            String diagnosis = req.getParameter("diagnosis");
            String medicine = req.getParameter("medicine");
            String nextAppointment = req.getParameter("nextAppointment");

            // 🗂️ Thư mục lưu PDF
            String uploadPath = getServletContext().getRealPath("") + File.separator + "medical-pdf";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            // 🧾 Kiểm tra file upload (nếu có)
            Part filePart = req.getPart("pdfResult");
            String fileName = (filePart != null && filePart.getSize() > 0)
                    ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString()
                    : null;

            String dbPath;

            if (fileName != null && !fileName.isEmpty()) {
                // Nếu có upload file → lưu file vào thư mục
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                dbPath = "medical-pdf/" + fileName;

            } else {
                // Nếu không upload → tự sinh file PDF từ thông tin nhập
                String autoName = "hoso_" + System.currentTimeMillis() + ".pdf";
                String filePath = uploadPath + File.separator + autoName;

                Document doc = new Document(PageSize.A4);
                PdfWriter.getInstance(doc, new FileOutputStream(filePath));
                doc.open();

                // ✅ Load font có hỗ trợ Unicode tiếng Việt
                // ⚠️ Đảm bảo bạn có file fonts/arial.ttf trong thư mục: src/main/webapp/fonts/
                String fontPath = getServletContext().getRealPath("") + "fonts" + File.separator + "arial.ttf";
                BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                Font titleFont = new Font(bf, 18, Font.BOLD);
                Font textFont = new Font(bf, 12, Font.NORMAL);

                // 🏥 Header + tiêu đề
                doc.add(new Paragraph("BỆNH VIỆN MEDIHOME", new Font(bf, 14, Font.BOLDITALIC)));
                doc.add(new Paragraph("Địa chỉ: 64KCLC, Vinhuni, Nghệ An", new Font(bf, 11, Font.NORMAL)));
                doc.add(new Paragraph("SĐT: 0368624899", new Font(bf, 11, Font.NORMAL)));
                doc.add(Chunk.NEWLINE);

                Paragraph title = new Paragraph("HỒ SƠ BỆNH ÁN", titleFont);
                title.setAlignment(Element.ALIGN_CENTER);
                doc.add(title);

                doc.add(new Paragraph("------------------------------------------------------", textFont));
                doc.add(new Paragraph("Mã cuộc hẹn: " + cuocHenId, textFont));
                doc.add(new Paragraph("Mã bệnh nhân: " + userId, textFont));
                doc.add(new Paragraph("Mã bác sĩ: " + doctorId, textFont));

                doc.add(Chunk.NEWLINE);
                doc.add(new Paragraph("Triệu chứng: " + symptoms, textFont));
                doc.add(new Paragraph("Chẩn đoán: " + diagnosis, textFont));
                doc.add(new Paragraph("Toa thuốc: " + medicine, textFont));
                doc.add(new Paragraph("Ngày tái khám: " + nextAppointment, textFont));
                doc.add(Chunk.NEWLINE);

                doc.add(new Paragraph("Ngày lập hồ sơ: " + new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date()), textFont));
                doc.add(Chunk.NEWLINE);
                doc.add(new Paragraph("------------------------------------------------------", textFont));

                // 👨‍⚕️ Chữ ký bác sĩ
                doc.add(new Paragraph("Bác sĩ xác nhận:", textFont));

                // Nếu có file chữ ký ảnh, thêm vào
                String signPath = getServletContext().getRealPath("") + "images" + File.separator + "chuKi.png";
                File signFile = new File(signPath);
                if (signFile.exists()) {
                    Image sign = Image.getInstance(signPath);
                    sign.scaleToFit(100, 50);
                    sign.setAlignment(Element.ALIGN_LEFT);
                    doc.add(sign);
                } else {
                    doc.add(new Paragraph("(Chưa có chữ ký)", textFont));
                }

                doc.close();
                dbPath = "medical-pdf/" + autoName;
            }

            // 🧠 Tạo đối tượng bệnh án
            Connection conn = DBConnect.getConn();
            HoSoBenhAn record = new HoSoBenhAn();
            record.setCuocHenId(cuocHenId);
            record.setUserId(userId);
            record.setDoctorId(doctorId);
            record.setSymptoms(symptoms);
            record.setDiagnosis(diagnosis);
            record.setMedicine(medicine);
            record.setNextAppointment(java.sql.Date.valueOf(nextAppointment));
            record.setPdfResult(dbPath);
            record.setCreatedAt(new Date());

            HoSoBenhAnDAO dao = new HoSoBenhAnDAO(conn);
            boolean success = dao.addHoSoBA(record);

            // 🏁 Sau khi thêm, cập nhật trạng thái lịch hẹn
            CuocHenDAO cuocHenDAO = new CuocHenDAO(conn);
            cuocHenDAO.updateStatus(cuocHenId, "Hoàn thành");

            HttpSession session = req.getSession();
            if (success) {
                session.setAttribute("succMsg", "Thêm hồ sơ bệnh án thành công !");
            } else {
                session.setAttribute("errorMsg", "Lỗi khi thêm hồ sơ!");
            }

            resp.sendRedirect("doctor/benhNhan.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Lỗi xử lý dữ liệu!");
            resp.sendRedirect("doctor/add_benh_an.jsp");
        }
    }
}
