package vivaParkDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vivaParkDTO.ResDTO;

public class ReserveDAO {

	private static ReserveDAO rDAO;
	
	private ReserveDAO() {
		super();
	}
	
	public static ReserveDAO getInstance() {
		if(rDAO == null) {
			rDAO=new ReserveDAO();
		}//end if
		return rDAO;
	}//getInstance
	
	
	public int  insertReserv(ResDTO rDTO) throws SQLException {
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCnt=0;

		try {
		//1.JNDI 사용객체 생성
		//2.DataSource 얻기
		//3.Connection 얻기
			con=dbCon.getConn();
		//4.쿼리문 생성객체 얻기
			String insertReserv=" insert into ticket_reserv(t_resnum, member_num, t_res_date, " +
				   " t_res_state, ticket_qr, ticket_num, prom_num ) values( seq.t_res_num.nextval, ?,?,?,?,?,? )";
			pstmt=con.prepareStatement(insertReserv);
		//5.바인드변수 값 설정
			pstmt.setString(1,rDTO.get);
			pstmt.setDate(2,rDTO);
			pstmt.setString(3,rDTO.);
			pstmt.setString(4,rDTO.);
			pstmt.setInt(5,rDTO.);
			pstmt.setInt(6,rDTO.);
			
		//6.조회결과 얻기
			
			rowCnt=pstmt.executeUpdate();
						
		}finally {
		//7.연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return rowCnt;
	}//selectAllDept


}//class
