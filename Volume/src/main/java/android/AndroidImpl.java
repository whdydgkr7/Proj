package android;

import org.apache.ibatis.annotations.Param;

import user.UserDTO;


public interface AndroidImpl {
	//로그인체크
	public UserDTO userCheck(@Param("dto") UserDTO dto);
}
