package day1119;

public class ImgDTO {
	private String img, url;
	
	public ImgDTO() {
		
	}

	
	
	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public ImgDTO(String img, String url) {
		super();
		this.img = img;
		this.url = url;
	}



	@Override
	public String toString() {
		return "ImgDTO [img=" + img + ", url=" + url + "]";
	}
	
	
	
}
