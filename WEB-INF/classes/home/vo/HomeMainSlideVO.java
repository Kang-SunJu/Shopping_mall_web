package home.vo;

import org.springframework.stereotype.Component;

@Component
public class HomeMainSlideVO {
	
	private int msId;
	private String msname, mspath;
	
	public int getMsId() {
		return msId;
	}
	public void setMsId(int msId) {
		this.msId = msId;
	}
	public String getMsname() {
		return msname;
	}
	public void setMsname(String msname) {
		this.msname = msname;
	}
	public String getMspath() {
		return mspath;
	}
	public void setMspath(String mspath) {
		this.mspath = mspath;
	}
	
}
