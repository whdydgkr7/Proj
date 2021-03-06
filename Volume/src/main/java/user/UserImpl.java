package user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface UserImpl {
	// �α���ó��
	public UserDTO login(String id, String pass);

	// ȸ������ó��
	public int regiUser(UserDTO usersDTO);

	// ���̵� �ߺ� üũ
	public int idCheck(String id);

	// ȸ������ ��������
	public UserDTO getUser(String id);

	// ȸ������ �̸�������
	public void GetKey(String id, String key);

	public void alter_userKey(String id, String key);

	// �̸��� ����Ȯ���ϱ�
	public int isAuth(String parameter);

	// 비밀번호찾기 - 임시비번생성후 업데이트
	public int randomPassUpdate(String userEmail, String randomStr);

	// 회원정보 수정
	public int Modifi(String name, String email, String pass, String id);

	// ���̵� ã��
	public String findId(String user_name, String user_email);
	// ��й�ȣ ã��

	public String findPass(String user_email);

	// 포인트사용
	public void point(String point, String userid);

	// 포인트 차감여부
	public int canpoint(String userid, String point);

	// 아이디 비번이 맞는 확인 여부
	public int userright(String parameter, String parameter2);

	// 포인트증가를위해 생성
	public int addPoint(String id);

}
