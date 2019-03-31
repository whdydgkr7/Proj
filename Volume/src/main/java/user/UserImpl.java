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

   //�̸��� ����Ȯ���ϱ�
   public int isAuth(String parameter);
   
   //���̵� ã��
   public String findId(@Param("user_name")String user_name, @Param("user_email")String user_email);
   //��й�ȣ ã��
   public String findPass(@Param("user_email")String user_email);

   //포인트사용
   public void point(String point, String userid);

    

	//public ArrayList<UserDTO> userPoint();
    
    
}