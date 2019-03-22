package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class OnedayDAO {
	private static OnedayDAO onedayDao=new OnedayDAO();
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private OnedayDAO() {
		try {
			//java파일에서 web.xml의 초기화 파라미터를 가져옴
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin://@localhost:1521:orcl", "project", "1234");
			System.out.println("DB 연결 성공 ^^*");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static OnedayDAO getInstance() {
		//System.out.println("DAO 객체 반환");
		return onedayDao;
	}
	//자원반납
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//신고 수 50이상 게시물 
	public List<OnedayDTO> highReportCountOneday(){
		String sql="SELECT report_count, idx, id, title, postdate FROM eBBS WHERE report_count >= 50 ORDER BY idx DESC";
		List<OnedayDTO> list=new Vector<OnedayDTO>();
		try {
			psmt=con.prepareStatement(sql);
			rs=psmt.executeQuery();
			while (rs.next()) {
				OnedayDTO dto=new OnedayDTO();
				dto.setReport_count(rs.getInt(1));
				dto.setIdx(rs.getInt(2));
				dto.setId(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setPostdate(rs.getString(5));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//글 삭제하기
	public boolean deleteOneday(int idx) {
		String sql="DELETE FROM eBBS WHERE idx=?";
		int result=0;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, idx);
			result=psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result==1?true:false;
	}
}
