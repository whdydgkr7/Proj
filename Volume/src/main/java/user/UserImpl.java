package user;

<<<<<<< HEAD

=======
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
>>>>>>> branch 'master' of https://github.com/whdydgkr7/proj.git

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


<<<<<<< HEAD
	//�̸��� ����Ȯ���ϱ�
	public int isAuth(String parameter);
	

	
	//비밀번호찾기 - 임시비번생성후 업데이트
	public int randomPassUpdate(String userEmail, String randomStr);
	
	//회원정보 수정
	public int Modifi(String name, String email, String pass, String id);

=======
   //�̸��� ����Ȯ���ϱ�
   public int isAuth(String parameter);
>>>>>>> branch 'master' of https://github.com/whdydgkr7/proj.git
   
   //���̵� ã��
   public String findId(String user_name, String user_email);
   //��й�ȣ ã��
<<<<<<< HEAD
   public String findPass(String user_email);
}
=======
   public String findPass(@Param("user_email")String user_email);

   //포인트사용
   public void point(String point, String userid);

    

	//비밀번호찾기 - 임시비번생성후 업데이트
	public int randomPassUpdate(String userEmail, String randomStr);
	
	//회원정보 수정
	public int Modifi(String name, String email, String pass, String id);
}

>>>>>>> branch 'master' of https://github.com/whdydgkr7/proj.git
