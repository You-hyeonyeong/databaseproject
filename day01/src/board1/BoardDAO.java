package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	private Connection conn; //접근하게 해주는 객체
	//private PreparedStatement pstmt; 함수가 많아서 혼동될 수 있으니 각 함수에 넣어준다.
	private ResultSet rs; //정보담을수 있는 객체
	//외부라이브러리
	public BoardDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 찾을수 있도록
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error]:" + e.getMessage());
		}
	}
	
	
	public String getDate() {
		String SQL= "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL= "SELECT m_number FROM market ORDER BY m_number DESC ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //현재가 첫번째 게시물일 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String m_name, String m_kind, String m_address, String m_time, String m_tele) {
		String SQL= "INSERT INTO market VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, m_name);
			pstmt.setString(3, m_kind);
			pstmt.setString(4, m_address);
			pstmt.setString(5, m_time);
			pstmt.setString(6, m_tele);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//글쓰한 게시물을 받아서 나열해주는 함수
	public ArrayList<Board> getList(int number) {
		String SQL= "SELECT * FROM market ORDER BY m_number DESC";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setM_number(rs.getInt(1));
				board.setM_name(rs.getString(2));
				board.setM_kind(rs.getString(3));
				board.setM_address(rs.getString(4));
				board.setM_time(rs.getString(5));
				board.setM_tele(rs.getString(6));
				list.add(board);
			}
			System.out.print(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Board getBoard(int m_number) {
		String SQL= "SELECT * FROM MARKET WHERE m_number = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,m_number);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setM_number(rs.getInt(1));
				board.setM_name(rs.getString(2));
				board.setM_kind(rs.getString(3));
				board.setM_address(rs.getString(4));
				board.setM_time(rs.getString(5));
				board.setM_tele(rs.getString(6));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
