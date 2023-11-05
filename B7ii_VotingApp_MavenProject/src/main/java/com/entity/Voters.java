package com.entity;



public class Voters {
	
	
	private int id;
	private String name;
	private String password;
	private String email;
	private int phone;

	public Voters() {
		
	}
	

	public Voters( int id, String name, String password, String email, int phone) {
		
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", phone="
				+ phone + "]";
	}

	
	
}
