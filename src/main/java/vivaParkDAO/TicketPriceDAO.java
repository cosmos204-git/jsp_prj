package vivaParkDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vivaParkDAO.DbConn;
import vivaParkDTO.TicketPriceDTO;

public class TicketPriceDAO {

		private static TicketPriceDAO tpDAO;
		
		private TicketPriceDAO() {
			super();
		}
		
		public static TicketPriceDAO getInstance() {
			if(tpDAO == null) {
				tpDAO=new TicketPriceDAO();
			}//end if
			return tpDAO;
		}//getInstance
		
		
		public List<TicketPriceDTO> selectAllTicketPrice() throws SQLException {
			List<TicketPriceDTO> list=new ArrayList<TicketPriceDTO>();
			
			DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
			
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			try {
			//1.JNDI 사용객체 생성
			//2.DataSource 얻기
			//3.Connection 얻기
				con=dbCon.getConn();
			//4.쿼리문 생성객체 얻기
				String selectTicketPrices="select ticket_name, adult_price, kids_price, baby_price from ticket";
				pstmt=con.prepareStatement(selectTicketPrices);
			//5.바인드변수 값 설정
			//6.조회결과 얻기
				TicketPriceDTO tpDTO=null;
				rs=pstmt.executeQuery();
				
				while( rs.next() ) {
					tpDTO=new TicketPriceDTO();
					tpDTO.setTicketName(rs.getString("ticket_name"));
					tpDTO.setAdultPrice(rs.getInt("adult_price"));
					tpDTO.setKidsPrice(rs.getInt("kids_price"));
					tpDTO.setYouthPrice(rs.getInt("baby_price"));
					list.add(tpDTO);
				}//end while
				
			}finally {
			//7.연결 끊기
				dbCon.dbClose(rs, pstmt, con);
			}//end finally
			return list;
		}//selectAllDept

		
}
