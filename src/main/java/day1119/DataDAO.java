package day1119;

import java.util.ArrayList;
import java.util.List;

public class DataDAO {
	public List<ImgDTO> selectImg(){
		List<ImgDTO> list=new ArrayList<ImgDTO>();
		
		list.add(new ImgDTO("daum.png","https://daum.net"));
		list.add(new ImgDTO("google.png","https://google.com"));
		list.add(new ImgDTO("naver.png","https://naver.com"));
		
		return list;
	}
}
