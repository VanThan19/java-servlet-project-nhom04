package com.entity;

public class CuocHen {
	private int id;
	private int userId;
	private String fullName;
	private String gioiTinh;
	private String age;
	private String ngayHen;
	private String email;
	private String sdt;
	private String benhTat;
	private int doctorId;
	private String diaChi;
	private String trangThai;
	public CuocHen() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CuocHen(int id, int userId, String fullName, String gioiTinh, String age, String ngayHen, String email,
			String sdt, String benhTat, int doctorId, String diaChi, String trangThai) {
		super();
		this.id = id;
		this.userId = userId;
		this.fullName = fullName;
		this.gioiTinh = gioiTinh;
		this.age = age;
		this.ngayHen = ngayHen;
		this.email = email;
		this.sdt = sdt;
		this.benhTat = benhTat;
		this.doctorId = doctorId;
		this.diaChi = diaChi;
		this.trangThai = trangThai;
	}
	public CuocHen(int userId, String fullName, String gioiTinh, String age, String ngayHen, String email, String sdt,
			String benhTat, int doctorId, String diaChi, String trangThai) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.gioiTinh = gioiTinh;
		this.age = age;
		this.ngayHen = ngayHen;
		this.email = email;
		this.sdt = sdt;
		this.benhTat = benhTat;
		this.doctorId = doctorId;
		this.diaChi = diaChi;
		this.trangThai = trangThai;
	}
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
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getNgayHen() {
		return ngayHen;
	}
	public void setNgayHen(String ngayHen) {
		this.ngayHen = ngayHen;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getBenhTat() {
		return benhTat;
	}
	public void setBenhTat(String benhTat) {
		this.benhTat = benhTat;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	@Override
	public String toString() {
		return "CuocHen [id=" + id + ", userId=" + userId + ", fullName=" + fullName + ", gioiTinh=" + gioiTinh
				+ ", age=" + age + ", ngayHen=" + ngayHen + ", email=" + email + ", sdt=" + sdt + ", benhTat=" + benhTat
				+ ", doctorId=" + doctorId + ", diaChi=" + diaChi + ", trangThai=" + trangThai + "]";
	}
	
	

}
