package user;



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
	

	
	//비밀번호찾기 - 임시비번생성후 업데이트
	public int randomPassUpdate(String userEmail, String randomStr);
	
	//회원정보 수정
	public int Modifi(String name, String email, String pass, String id);

   
   //���̵� ã��
   public String findId(String user_name, String user_email);
   //��й�ȣ ã��
   public String findPass(String user_email);
}
