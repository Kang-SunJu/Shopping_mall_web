package common.vo;

public class PageVO {
	private int pageList = 10; //�������� ������ ��� ��
	private int blockPage = 10; //���� ������ �������� ��
	private int totalList;   //�� ��ϼ�
	private int totalPage;   //�� ��������
	private int totalBlock;  //�� ��ϼ�
	private int curPage;     //���� ������
	private int endList, beginList;  //�� ��Ϲ�ȣ, ���� ��Ϲ�ȣ
	private int curBlock;    //���� ��
	private int endPage, beginPage;  //�� ��������ȣ, ���� ��������ȣ
	private String search, keyword; //�˻������ʵ�
	
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
		//�� ��ϼ��� ���� �� ���������� ������
		//������ = �� ��ϼ� / �������� ������ ��� ��
		// 403 / 10 = 40 ... 3 : �������� ������ +1 -> 41������
		totalPage = totalList / pageList;
		totalPage += (totalList % pageList > 0 ? 1 : 0);
		
		//�� ���������� ���� �� ������ ������
		//�� ��ϼ� = ���������� / ���纸���� �������� 
		// 41 / 10 = 4 ... 1 : �������� ������ +1 -> 5��
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage > 0 )  ++totalBlock;
		
//		�� ��Ϲ�ȣ : �� ��ϼ� - (��������ȣ-1)* �������� ������ ��ϼ�
//		���� ��Ϲ�ȣ : �� ��Ϲ�ȣ - (�������� ������ ��ϼ�-1)
//		1������: 403 ~ 394 
//		2������: 393 ~ 384 
		endList = totalList - (curPage-1)*pageList;
		beginList = endList - (pageList-1);
		
//		��Ϲ�ȣ : ������������ȣ / ��ϴ� ������ ��������
//		32 / 10 = 3 ... 2 : �������� ������ +1 -> 4
//		1��: 1~10,  2��: 11~20, 3��: 21~30, 4��: 31~40  
		curBlock = curPage / blockPage;
		if( curPage % blockPage > 0 ) ++curBlock;
		
//		�� ��������ȣ : ��Ϲ�ȣ * ��ϴ� ������ ��������
//		���� ��������ȣ : �� ��������ȣ - (���� ������ ��������-1)
		endPage = curBlock * blockPage;
		beginPage = endPage - (blockPage-1);
		
//		403���� �� : ��������= 41 ������ 
//		1������: 403~394, ... 40������: 13~4, 41������: 3~1
//		���� = 5��
//		1��: 1~10,  ... 4��:31~40,  5��:41
		
//		������ ����������ȣ�� �������������� Ŭ �� ����
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
