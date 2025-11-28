package com.entity;

public class Benh {
	private int id;
	private String tenBenh;
	private String trieuChung;
	private int chuyenKhoaId;

	public Benh() {
	}

	public Benh(int id, String tenBenh, String trieuChung, int chuyenKhoaId) {
		this.id = id;
		this.tenBenh = tenBenh;
		this.trieuChung = trieuChung;
		this.chuyenKhoaId = chuyenKhoaId;
	}

	public Benh(String tenBenh, String trieuChung, int chuyenKhoaId) {
		this.tenBenh = tenBenh;
		this.trieuChung = trieuChung;
		this.chuyenKhoaId = chuyenKhoaId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenBenh() {
		return tenBenh;
	}

	public void setTenBenh(String tenBenh) {
		this.tenBenh = tenBenh;
	}

	public String getTrieuChung() {
		return trieuChung;
	}

	public void setTrieuChung(String trieuChung) {
		this.trieuChung = trieuChung;
	}

	public int getChuyenKhoaId() {
		return chuyenKhoaId;
	}

	public void setChuyenKhoaId(int chuyenKhoaId) {
		this.chuyenKhoaId = chuyenKhoaId;
	}

	@Override
	public String toString() {
		return "Benh [id=" + id + ", tenBenh=" + tenBenh + ", trieuChung=" + trieuChung + ", chuyenKhoaId="
				+ chuyenKhoaId + "]";
	}

}
