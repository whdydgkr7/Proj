package myPage;

import java.util.ArrayList;

import model.ProjectBbsDTO;
import user.UserDTO;

public interface MyPageImpl {

	
	
	

	public ArrayList<ProjectBbsDTO> ViewProj(String id);
	
	
	//내가 참가한 리스트 띄우기
	public ArrayList<ProjectBbsDTO> ViewMyProj(String id);

}
