package com.entity;

public class Users {
	private int Id;
	private String FullName;
	private String Email;
	private String Password;
	
	
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(int id, String fullName, String email, String password) {
		super();
		Id = id;
		FullName = fullName;
		Email = email;
		Password = password;
	}
	public Users(String fullName, String email, String password) {
		super();
		FullName = fullName;
		Email = email;
		Password = password;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getFullName() {
		return FullName;
	}
	public void setFullName(String fullName) {
		FullName = fullName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	@Override
	public String toString() {
		return "Users [Id=" + Id + ", FullName=" + FullName + ", Email=" + Email + ", Password=" + Password + "]";
	}
	
	

}
