package home.vo;

import org.springframework.stereotype.Component;

@Component
public class HomeMenuSlideVO {
	private int menuId;
	private String menuContent, menuName, menupath;

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public String getMenuContent() {
		return menuContent;
	}

	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenupath() {
		return menupath;
	}

	public void setMenupath(String menupath) {
		this.menupath = menupath;
	}
	
	
}