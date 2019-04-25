package buy.vo;

import java.sql.Date;

public class BuyListVO {
	private String orderno;
	private String product_id;
	private String product_name;
	private String su;
	private String price;
	private String address[], addresses;
	private String phone[], phones;
	private String userid;
	private String ordername;
	private String buy_date;
	private String product_img_path;
	
	
	public String getProduct_img_path() {
		return product_img_path;
	}

	public void setProduct_img_path(String product_img_path) {
		this.product_img_path = product_img_path;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}


	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String[] address) {
		this.address = address;
		addresses = String.join("<br>", address);
	}

	/**
	 * @return the addresses
	 */
	public String getAddresses() {
		return addresses;
	}

	/**
	 * @param addresses
	 *            the addresses to set
	 */
	public void setAddresses(String addresses) {
		this.addresses = addresses;
		address = addresses.split("<br>");
	}

	/**
	 * @return the phone
	 */
	public String[] getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String[] phone) {
		this.phone = phone;
		phones = String.join("-", phone);
	}

	/**
	 * @return the phones
	 */
	public String getPhones() {
		return phones;
	}

	/**
	 * @param phones
	 *            the phones to set
	 */
	public void setPhones(String phones) {
		this.phones = phones;
		phone = phones.split("-");
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getSu() {
		return su;
	}

	public void setSu(String su) {
		this.su = su;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getOrdername() {
		return ordername;
	}

	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}

	public String[] getAddress() {
		return address;
	}

}
