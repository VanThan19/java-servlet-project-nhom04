package com.entity;

import java.util.Date;

public class HoSoBenhAn {
	private int id;
    private int cuocHenId;
    private int userId;
    private int doctorId;
    private String symptoms;
    private String diagnosis;
    private String medicine;
    private Date nextAppointment;
    private String pdfResult;
    private Date createdAt;
    private String doctorName;
    private String appointmentDate;
    

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getCuocHenId() { return cuocHenId; }
    public void setCuocHenId(int cuocHenId) { this.cuocHenId = cuocHenId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getDoctorId() { return doctorId; }
    public void setDoctorId(int doctorId) { this.doctorId = doctorId; }

    public String getSymptoms() { return symptoms; }
    public void setSymptoms(String symptoms) { this.symptoms = symptoms; }

    public String getDiagnosis() { return diagnosis; }
    public void setDiagnosis(String diagnosis) { this.diagnosis = diagnosis; }

    public String getMedicine() { return medicine; }
    public void setMedicine(String medicine) { this.medicine = medicine; }

    public Date getNextAppointment() { return nextAppointment; }
    public void setNextAppointment(Date nextAppointment) { this.nextAppointment = nextAppointment; }

    public String getPdfResult() { return pdfResult; }
    public void setPdfResult(String pdfResult) { this.pdfResult = pdfResult; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    
    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    public String getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(String appointmentDate) { this.appointmentDate = appointmentDate; }

}
