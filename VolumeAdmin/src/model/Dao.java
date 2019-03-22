package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

public class Dao {
	
	private static Dao dao=new Dao();
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private Dao() {
		try {
			//java파일에서 web.xml의 초기화 파라미터를 가져옴
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin://@localhost:1521:orcl", "project", "1234");
			System.out.println("DB 연결 성공 ^^*");
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	public static Dao getInstance() {
		//System.out.println("DAO 객체 반환");
		return dao;
	}
	//유저 활동정지
	public void pauseUser(String id) {
		String sql="UPDATE users SET enabled=0 WHERE id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//유저 활동정지 해제
	public void activateUser(String id) {
		String sql="UPDATE users SET enabled=1 WHERE id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//유저 정보 수정
	public void modifyUser(UserDTO dto) {
		String sql="UPDATE users SET name=?,email=?,point=?,enabled=?,authority=?,userType=? WHERE id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getEmail());
			psmt.setInt(3, dto.getPoint());
			psmt.setInt(4, dto.getEnabled());
			psmt.setString(5, dto.getAuthority());
			psmt.setString(6, dto.getUserType());
			psmt.setString(7, dto.getId());
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//유저 정보 반환(1명)
	public UserDTO getUser(String id) {
		String sql = "SELECT id, name, to_char(regidate, 'yyyy\"년 \"MM\"월 \"dd\"일\" day'), email, point, enabled, authority, userType FROM users WHERE id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			rs.next();
			UserDTO dto=new UserDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setRegidate(rs.getString(3));
			dto.setEmail(rs.getString("email"));
			dto.setPoint(rs.getInt("point"));
			dto.setEnabled(rs.getInt("enabled"));
			dto.setAuthority(rs.getString("authority"));
			dto.setUserType(rs.getString("userType"));
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//유저 리스트 반환
	public List<UserDTO> getUserList(){
		String sql="SELECT id, name, to_char(regidate, 'yyyy\"년 \"MM\"월 \"dd\"일\" day'), email, point, enabled, authority, userType FROM users WHERE id != 'admin' ";
		List<UserDTO> list=new Vector<UserDTO>();
		try {
			psmt=con.prepareStatement(sql);
			rs=psmt.executeQuery();
			while (rs.next()) {
				UserDTO dto=new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
				dto.setEmail(rs.getString("email"));
				dto.setPoint(rs.getInt("point"));
				dto.setEnabled(rs.getInt("enabled"));
				dto.setAuthority(rs.getString("authority"));
				dto.setUserType(rs.getString("userType"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//실시간 회원검색 구현하기
	public List<UserDTO> searchUser(String id)
	{		
		List<UserDTO> list = new Vector<UserDTO>();
		String sql = "SELECT id, name, to_char(regidate, 'yyyy\"년 \"MM\"월 \"dd\"일\" day'), email, point, enabled, authority, userType FROM users "
			+ " WHERE id LIKE ? AND authority != 'ADMIN' "
			+ " ORDER BY id ASC";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,"%"+id+"%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				UserDTO dto=new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString(3));
				dto.setEmail(rs.getString("email"));
				dto.setPoint(rs.getInt("point"));
				dto.setEnabled(rs.getInt("enabled"));
				dto.setAuthority(rs.getString("authority"));
				dto.setUserType(rs.getString("userType"));
				list.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}		
		
		return list;
	}
	
	//유저 삭제
	public int deleteUser(String id) {
		String sql="DELETE FROM users WHERE id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
	
	
	
	//관리자 추가
	public boolean addAdmin(UserDTO dto) {
		String sql="INSERT INTO users (id, pass, name, email, point,AUTHORITY) "
				+ "VALUES (?,?,?,?,?,?)";
		int result=0;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setInt(5, dto.getPoint());
			psmt.setString(6, dto.getAuthority());
			result=psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result==1?true:false;
	}
	
	//관리자 계정 불러오기 
	public UserDTO getAdmin(String id) {
		String sql = "SELECT id, pass, name, to_char(regidate, 'yyyy\"년 \"MM\"월 \"dd\"일\" day'), email, point, enabled, authority FROM users WHERE id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			rs.next();
			UserDTO dto=new UserDTO();
			dto.setId(rs.getString("id"));
			dto.setPass(rs.getString("pass"));
			dto.setName(rs.getString("name"));
			dto.setRegidate(rs.getString(3));
			dto.setEmail(rs.getString("email"));
			dto.setPoint(rs.getInt("point"));
			dto.setEnabled(rs.getInt("enabled"));
			dto.setAuthority(rs.getString("authority"));
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//관리자 정보 수정
	public void modifyAdmin(UserDTO dto) {
		String sql="UPDATE users SET pass=?, name=?,email=?,point=?,enabled=?,authority=? WHERE id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getEmail());
			psmt.setInt(4, dto.getPoint());
			psmt.setInt(5, dto.getEnabled());
			psmt.setString(6, dto.getAuthority());
			psmt.setString(7, dto.getId());
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//관리자 리스트 출력
	public List<UserDTO> getAdminList(){
		String sql="SELECT id, pass, name, to_char(regidate, 'yyyy\"년 \"MM\"월 \"dd\"일\" day'), email, point, enabled, authority FROM users WHERE authority = 'ADMIN' ";
		List<UserDTO> list=new Vector<UserDTO>();
		try {
			psmt=con.prepareStatement(sql);
			rs=psmt.executeQuery();
			while (rs.next()) {
				UserDTO dto=new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString(4));
				dto.setEmail(rs.getString("email"));
				dto.setPoint(rs.getInt("point"));
				dto.setEnabled(rs.getInt("enabled"));
				dto.setAuthority(rs.getString("authority"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
