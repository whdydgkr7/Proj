package user;

import org.apache.ibatis.annotations.Param;

public interface UserImpl {
	// 로그인처리
	public UserDTO login(String id, String pass);

	// 회원가입처리
	public int regiUser(UserDTO usersDTO);

	// 아이디 중복 체크
	public int idCheck(String id);

	// 회원정보 가져오기
	public UserDTO getUser(String id);

	// 회원가입 이메일인증
	public void GetKey(String id, String key);
	public void alter_userKey(String id, String key);

	//이메일 인증확인하기
	public int isAuth(String parameter);
	
	//아이디 찾기
	public String findId(@Param("user_name")String user_name, @Param("user_email")String user_email);
	//비밀번호 찾기
	public String findPass(@Param("user_email")String user_email);
}
