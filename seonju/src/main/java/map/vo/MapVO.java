package map.vo;

import org.springframework.stereotype.Component;

@Component
public class MapVO {
	private int storeNum;
	private String storeName, storeImg1, storeImg2, storeImg3, storeImg4, storeCon;
	
	public int getStoreNum() {
		return storeNum;
	}
	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreImg1() {
		return storeImg1;
	}
	public void setStoreImg1(String storeImg1) {
		this.storeImg1 = storeImg1;
	}
	public String getStoreImg2() {
		return storeImg2;
	}
	public void setStoreImg2(String storeImg2) {
		this.storeImg2 = storeImg2;
	}
	public String getStoreImg3() {
		return storeImg3;
	}
	public void setStoreImg3(String storeImg3) {
		this.storeImg3 = storeImg3;
	}
	public String getStoreImg4() {
		return storeImg4;
	}
	public void setStoreImg4(String storeImg4) {
		this.storeImg4 = storeImg4;
	}
	public String getStoreCon() {
		return storeCon;
	}
	public void setStoreCon(String storeCon) {
		this.storeCon = storeCon;
	}
	
}