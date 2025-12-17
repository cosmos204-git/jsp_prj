package vivaParkDTO;

public class ResDTO {
	private int ticketNum, adultPrice, youthPrice, kidsPrice;
	private String ticketName;
	
	public ResDTO() {
		super();
	}

	public ResDTO(int ticketNum, int adultPrice, int youthPrice, int kidsPrice, String ticketName) {
		super();
		this.ticketNum = ticketNum;
		this.adultPrice = adultPrice;
		this.youthPrice = youthPrice;
		this.kidsPrice = kidsPrice;
		this.ticketName = ticketName;
	}

	public int getTicketNum() {
		return ticketNum;
	}

	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}

	public int getAdultPrice() {
		return adultPrice;
	}

	public void setAdultPrice(int adultPrice) {
		this.adultPrice = adultPrice;
	}

	public int getYouthPrice() {
		return youthPrice;
	}

	public void setYouthPrice(int youthPrice) {
		this.youthPrice = youthPrice;
	}

	public int getKidsPrice() {
		return kidsPrice;
	}

	public void setKidsPrice(int kidsPrice) {
		this.kidsPrice = kidsPrice;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}

	@Override
	public String toString() {
		return "ResDTO [ticketNum=" + ticketNum + ", adultPrice=" + adultPrice + ", youthPrice=" + youthPrice
				+ ", kidsPrice=" + kidsPrice + ", ticketName=" + ticketName + "]";
	}
	
	
	
}
