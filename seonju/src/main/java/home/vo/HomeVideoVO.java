package home.vo;

import org.springframework.stereotype.Component;

@Component
public class HomeVideoVO {
	
	private int videoNum;
	private String videoPath;
	
	public int getVideoNum() {
		return videoNum;
	}

	public void setVideoNum(int videoNum) {
		this.videoNum = videoNum;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}
	
}