package kr.co.oda.vo;

public class AdminUserVo {
	private Long no;
	private String adId;
	private String adPw;
	private String adName;
	private String adPhone;
	private String adAddr;
	private String stName;
	private String stPhone;
	private int stTbcnt;
	private String stNum;
	private String regDate;
	
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public int getStTbcnt() {
		return stTbcnt;
	}
	public void setStTbcnt(int stTbcnt) {
		this.stTbcnt = stTbcnt;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPw() {
		return adPw;
	}
	public void setAdPw(String adPw) {
		this.adPw = adPw;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdPhone() {
		return adPhone;
	}
	public void setAdPhone(String adPhone) {
		this.adPhone = adPhone;
	}
	public String getAdAddr() {
		return adAddr;
	}
	public void setAdAddr(String adAddr) {
		this.adAddr = adAddr;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public String getStPhone() {
		return stPhone;
	}
	public void setStPhone(String stPhone) {
		this.stPhone = stPhone;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "AdminVo [adId=" + adId + ", adPw=" + adPw + ", adName=" + adName + ", adPhone=" + adPhone + ", adAddr="
				+ adAddr + ", stName=" + stName + ", stPhone=" + stPhone + ", stTbcnt=" + stTbcnt + ", stNum=" + stNum
				+ ", regDate=" + regDate + "]";
	}	
	
}
