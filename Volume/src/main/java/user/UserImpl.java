package user;

public interface UserImpl {
	//로그인처리
	public UserDTO login(String id, String pass);
	//회원가입처리
	public int regiUser(UserDTO usersDTO);
	//아이디 중복 체크
	public int idCheck(String id);
}
