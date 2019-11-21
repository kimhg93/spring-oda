package kr.co.oda.vo;

public class MenuVo {
	private Long no;
	private String name;
	private int category;
	private int idx;
	private int price;
	private String subinfo;
	private int maxcnt;
	private String thum;
	private String stNum;	
	private int cnt;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSubinfo() {
		return subinfo;
	}
	public void setSubinfo(String subinfo) {
		this.subinfo = subinfo;
	}
	public int getMaxcnt() {
		return maxcnt;
	}
	public void setMaxcnt(int maxcnt) {
		this.maxcnt = maxcnt;
	}
	public String getThum() {
		return thum;
	}
	public void setThum(String thum) {
		this.thum = thum;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "MenuVo [name=" + name + ", category=" + category + ", idx=" + idx + ", price=" + price + ", subinfo="
				+ subinfo + ", maxcnt=" + maxcnt + ", thum=" + thum + ", stNum=" + stNum + ", cnt=" + cnt + "]";
	}
		
}
