package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class ProposeDAO {
	private static ProposeDAO proposeDao=new ProposeDAO();
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public ProposeDAO() {
		try {
			//java파일에서 web.xml의 초기화 파라미터를 가져옴
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin://@localhost:1521:orcl", "kosmo", "1234");
			System.out.println("DB 연결 성공 ^^*");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static ProposeDAO getInstance() {
		//System.out.println("DAO 객체 반환");
		return proposeDao;
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
	
	//제안 거절
	public boolean refusePropose(int propose_idx) {
		String sql="DELETE FROM pbbs WHERE idx=?";
		int result=0;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, propose_idx);
			result=psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result==1? true:false;
	}
	
	//추천수 30이 넘는 프로젝트 제안서 불러오기
	public List<ProjectBbsDTO> highRecommandPropose() {
		String sql="SELECT * FROM pbbs WHERE recommend >= 30 and state='대기중' ORDER BY recommend DESC";
		List<ProjectBbsDTO> list=new Vector<ProjectBbsDTO>();
		try {
			psmt=con.prepareStatement(sql);
			rs=psmt.executeQuery();
			while (rs.next()) {
				ProjectBbsDTO dto=new ProjectBbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate").toString());
				dto.setVisit_count(rs.getInt("visit_count"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setTitle(rs.getString("title"));
				dto.setStart_date(rs.getDate("start_date").toString());
				dto.setEnd_date(rs.getDate("end_date").toString());
				dto.setM_limit(rs.getInt("m_limit"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setAttachedfile(rs.getString("attachedfile"));
				dto.setAddress(rs.getString("address"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//프로젝트 제안 테이블에서 하나 가져오기
	public ProjectBbsDTO getPropose(int idx) {
		String sql="SELECT * FROM pbbs WHERE idx=?";
		ProjectBbsDTO dto=null;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs=psmt.executeQuery();
			rs.next();
			dto=new ProjectBbsDTO();
			dto.setIdx(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setPostdate(rs.getDate(4).toString());
			dto.setVisit_count(rs.getInt(5));
			dto.setRecommend(rs.getInt(6));
			dto.setTitle(rs.getString(7));
			dto.setStart_date(rs.getDate(8).toString());
			dto.setEnd_date(rs.getDate(9).toString());
			dto.setM_limit(rs.getInt(10));
			dto.setThumbnail(rs.getString(11));
			dto.setAttachedfile(rs.getString(12));
			dto.setAddress(rs.getString(13));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//프로젝트 제안 승인
	public void submitPropose(int idx) {
		String sql="UPDATE pbbs SET state='종료'  where idx= ?";
		
		try {
			psmt= con.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs=psmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
