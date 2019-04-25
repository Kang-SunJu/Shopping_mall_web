package home.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component
public class HomeVO {
	private String title;
	private Date writedate;
	
	
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
}
