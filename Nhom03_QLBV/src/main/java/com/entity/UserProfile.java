package com.entity;

import java.sql.Date;

public class UserProfile {
	private int id;
    private int userId;
    private String gender;
    private Date dob;
    private String phone;
    private String address;
    private String insuranceNumber;
    private String avatar;

    public UserProfile() {
        super();
    }

    public UserProfile(int id, int userId, String gender, Date dob, String phone, 
                       String address, String insuranceNumber, String avatar) {
        super();
        this.id = id;
        this.userId = userId;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
        this.insuranceNumber = insuranceNumber;
        this.avatar = avatar;
    }

    // Getter & Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getInsuranceNumber() {
        return insuranceNumber;
    }

    public void setInsuranceNumber(String insuranceNumber) {
        this.insuranceNumber = insuranceNumber;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

}
