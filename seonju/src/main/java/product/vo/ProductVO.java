package product.vo;

public class ProductVO {
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_img_path;
	private String product_img_name;
	private int detail_id;
	private String product_menu;
	
	
	public String getProduct_menu() {
		return product_menu;
	}
	public void setProduct_menu(String product_menu) {
		this.product_menu = product_menu;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_img_path() {
		return product_img_path;
	}
	public void setProduct_img_path(String product_img_path) {
		this.product_img_path = product_img_path;
	}
	public String getProduct_img_name() {
		return product_img_name;
	}
	public void setProduct_img_name(String product_img_name) {
		this.product_img_name = product_img_name;
	}
}
