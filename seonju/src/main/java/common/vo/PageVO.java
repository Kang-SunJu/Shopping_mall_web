package common.vo;

public class PageVO {
	private int pageList = 10; //페이지당 보여질 목록 수
	private int blockPage = 10; //블럭당 보여질 페이지의 수
	private int totalList;   //총 목록수
	private int totalPage;   //총 페이지수
	private int totalBlock;  //총 블록수
	private int curPage;     //현재 페이지
	private int endList, beginList;  //끝 목록번호, 시작 목록번호
	private int curBlock;    //현재 블럭
	private int endPage, beginPage;  //끝 페이지번호, 시작 페이지번호
	private String search, keyword; //검색관련필드
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPageList() {
		return pageList;
	}
	public void setPageList(int pageList) {
		this.pageList = pageList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getTotalList() {
		return totalList;
	}
	public void setTotalList(int totalList) {
		this.totalList = totalList;
		//총 목록수에 따라 총 페이지수가 결정됨
		//페이지 = 총 목록수 / 페이지당 보여질 목록 수
		// 403 / 10 = 40 ... 3 : 나머지가 있으면 +1 -> 41페이지
		totalPage = totalList / pageList;
		totalPage += (totalList % pageList > 0 ? 1 : 0);
		
		//총 페이지수에 따라 총 블럭수가 결정됨
		//총 블록수 = 총페이지수 / 블럭당보여질 페이지수 
		// 41 / 10 = 4 ... 1 : 나머지가 있으면 +1 -> 5블럭
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage > 0 )  ++totalBlock;
		
//		끝 목록번호 : 총 목록수 - (페이지번호-1)* 페이지당 보여질 목록수
//		시작 목록번호 : 끝 목록번호 - (페이지당 보여질 목록수-1)
//		1페이지: 403 ~ 394 
//		2페이지: 393 ~ 384 
		endList = totalList - (curPage-1)*pageList;
		beginList = endList - (pageList-1);
		
//		블록번호 : 현재페이지번호 / 블록당 보여질 페이지수
//		32 / 10 = 3 ... 2 : 나머지가 있으면 +1 -> 4
//		1블럭: 1~10,  2블럭: 11~20, 3블럭: 21~30, 4블럭: 31~40  
		curBlock = curPage / blockPage;
		if( curPage % blockPage > 0 ) ++curBlock;
		
//		끝 페이지번호 : 블록번호 * 블록당 보여질 페이지수
//		시작 페이지번호 : 끝 페이지번호 - (블럭당 보여질 페이지수-1)
		endPage = curBlock * blockPage;
		beginPage = endPage - (blockPage-1);
		
//		403개의 글 : 페이지수= 41 페이지 
//		1페이지: 403~394, ... 40페이지: 13~4, 41페이지: 3~1
//		블럭수 = 5블럭
//		1블럭: 1~10,  ... 4블럭:31~40,  5블럭:41
		
//		끝블럭의 끝페이지번호는 총페이지수보다 클 수 없다
		if( endPage > totalPage ) endPage = totalPage; 
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getEndList() {
		return endList;
	}
	public void setEndList(int endList) {
		this.endList = endList;
	}
	public int getBeginList() {
		return beginList;
	}
	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	
}
