package vivaParkDTO;

import java.sql.Date;

public class ResInfoDTO {
	private int adultCnt, youthCnt, kidsCnt, totalPrice, prom_num, discount;
	private Date resDate, useDate;
	private String prom_pay_agency;

	public ResInfoDTO() {
		super();
	}

	public ResInfoDTO(int adultCnt, int youthCnt, int kidsCnt, int totalPrice, int prom_num, int discount, Date resDate,
			Date useDate, String prom_pay_agency) {
		super();
		this.adultCnt = adultCnt;
		this.youthCnt = youthCnt;
		this.kidsCnt = kidsCnt;
		this.totalPrice = totalPrice;
		this.prom_num = prom_num;
		this.discount = discount;
		this.resDate = resDate;
		this.useDate = useDate;
		this.prom_pay_agency = prom_pay_agency;
	}

	public int getAdultCnt() {
		return adultCnt;
	}

	public void setAdultCnt(int adultCnt) {
		this.adultCnt = adultCnt;
	}

	public int getYouthCnt() {
		return youthCnt;
	}

	public void setYouthCnt(int youthCnt) {
		this.youthCnt = youthCnt;
	}

	public int getKidsCnt() {
		return kidsCnt;
	}

	public void setKidsCnt(int kidsCnt) {
		this.kidsCnt = kidsCnt;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getProm_num() {
		return prom_num;
	}

	public void setProm_num(int prom_num) {
		this.prom_num = prom_num;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public String getProm_pay_agency() {
		return prom_pay_agency;
	}

	public void setProm_pay_agency(String prom_pay_agency) {
		this.prom_pay_agency = prom_pay_agency;
	}

	@Override
	public String toString() {
		return "ResInfoDTO [adultCnt=" + adultCnt + ", youthCnt=" + youthCnt + ", kidsCnt=" + kidsCnt + ", totalPrice="
				+ totalPrice + ", prom_num=" + prom_num + ", discount=" + discount + ", resDate=" + resDate
				+ ", useDate=" + useDate + ", prom_pay_agency=" + prom_pay_agency + "]";
	}

	
	
}
