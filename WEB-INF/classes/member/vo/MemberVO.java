package member.vo;

import java.sql.Date;

public class MemberVO {
	private int no;
	private String name, userid, userpwd, email;
	private String phone[], phones, post, address[], addresses;
	private Date birth;
	private String admin;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getPhones() {
		return phones;
	}
	public void setPhones(String phones) {
		this.phones = phones;
		//- 로 엮어진 연락처를 분리해서 배열변수 phone 에 담는다.
		phone = phones.split("-");
	}
	public String getAddresses() {
		return addresses;
	}
	public void setAddresses(String addresses) {
		this.addresses = addresses;
		//<br>로 엮어진 주소를 분리해서 배열변수 address 에 담는다.
		address = addresses.split("<br>");
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String[] getPhone() {
		return phone;
	}
	public void setPhone(String[] phone) {
		this.phone = phone;
		//배열변수 각각의 연락처를 - 로 엮어 phones 에 담는다
		phones = String.join("-", phone);
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String[] getAddress() {
		return address;
	}
	public void setAddress(String[] address) {
		this.address = address;
		//두 개의 기본주소, 상세주소를 <br>엮어서 addresses 담는다
		addresses = String.join("<br>", address);
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	

	
}
