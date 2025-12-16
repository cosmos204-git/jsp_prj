package day1128;

public class MemberService {
	public void joinMember(ParamDTO pDTO) {
		//회원테이블 insert하는 Query 실행하는 DAO method 부르기
		System.out.println("Service"+ pDTO);
		//로그인이라면 히스토리 테이블에 insert하는 쿼리를 실행하는 DAO method
		//
	}
}
