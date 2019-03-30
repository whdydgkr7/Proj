package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class ProposeDAO {
	private static ProposeDAO proposeDao=new ProposeDAO();
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private ProposeDAO() {
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
		String sql="DELETE FROM pPropose WHERE propose_idx=?";
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
	
	//추천수 100이 넘는 프로젝트 제안서 불러오기
	public List<ProposeDTO> highRecommandPropose() {
		String sql="SELECT * FROM pbbs WHERE recommend >= 30 ORDER BY recommend DESC";
		List<ProposeDTO> list=new Vector<ProposeDTO>();
		try {
			psmt=con.prepareStatement(sql);
			rs=psmt.executeQuery();
			while (rs.next()) {
				ProposeDTO dto=new ProposeDTO();
				dto.setPropose_idx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPostdate(rs.getDate(4));
				dto.setVisit_count(rs.getInt(5));
				dto.setRecommend(rs.getInt(6));
				dto.setTitle(rs.getString(7));
				dto.setStart_date(rs.getDate(8));
				dto.setEnd_date(rs.getDate(9));
				dto.setP_limit(rs.getInt(10));
				dto.setThumbnail(rs.getString(11));
				dto.setAttachedfile(rs.getString(12));
				dto.setAddress(rs.getString(13));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//프로젝트 제안 테이블에서 하나 가져오기
	public ProposeDTO getPropose(int propose_idx) {
		String sql="SELECT * FROM pPropose WHERE propose_idx=?";
		ProposeDTO dto=null;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, propose_idx);
			rs=psmt.executeQuery();
			rs.next();
			dto=new ProposeDTO();
			dto.setPropose_idx(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setPostdate(rs.getDate(4));
			dto.setVisit_count(rs.getInt(5));
			dto.setRecommend(rs.getInt(6));
			dto.setTitle(rs.getString(7));
			dto.setStart_date(rs.getDate(8));
			dto.setEnd_date(rs.getDate(9));
			dto.setP_limit(rs.getInt(10));
			dto.setThumbnail(rs.getString(11));
			dto.setAttachedfile(rs.getString(12));
			dto.setAddress(rs.getString(13));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//프로젝트 제안 승인
	public boolean submitPropose(ProposeDTO dto) {
		String sql="INSERT INTO pBBS (idx, id, title, content, postdate, start_date, end_date, address, attachedfile, thumbnail, m_limit) "
			+ " VALUES (pBBs_seq.nextval,?,?,?,?,?, ?,?,?,?,?)";
		int result=0;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setDate(4, dto.getPostdate());
			psmt.setDate(5, dto.getStart_date());
			psmt.setDate(6, dto.getEnd_date());
			psmt.setString(7, dto.getAddress());
			psmt.setString(8, dto.getAttachedfile());
			psmt.setString(9, dto.getThumbnail());
			psmt.setInt(10, dto.getP_limit());
			result=psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		refusePropose(dto.getPropose_idx());
		return result==1? true:false;
	}
	
}
