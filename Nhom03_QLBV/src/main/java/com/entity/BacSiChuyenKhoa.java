package com.entity;

public class BacSiChuyenKhoa {
	private int Id;
	private String TenChuyenKhoa;
	public BacSiChuyenKhoa() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BacSiChuyenKhoa(int id, String tenChuyenKhoa) {
		super();
		Id = id;
		TenChuyenKhoa = tenChuyenKhoa;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getTenChuyenKhoa() {
		return TenChuyenKhoa;
	}
	public void setTenChuyenKhoa(String tenChuyenKhoa) {
		TenChuyenKhoa = tenChuyenKhoa;
	}
	@Override
	public String toString() {
		return "BacSiChuyenKhoa [Id=" + Id + ", TenChuyenKhoa=" + TenChuyenKhoa + "]";
	}
	
	

}
