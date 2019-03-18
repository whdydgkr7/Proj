package naver;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import user.UserDTO;

public class JsonParser {
	JSONParser jsonParser = new JSONParser();

	public UserDTO changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		JSONParser jsonParser = new JSONParser();
		UserDTO dto = new UserDTO();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");
		
		map.put("userId", jsonObject.get("id"));
		map.put("userNickname", jsonObject.get("nickname"));
		map.put("userEmail", jsonObject.get("email"));
		

		dto.setName(map.get("userNickname").toString());
		dto.setEmail(map.get("userEmail").toString());
		dto.setId(map.get("userId").toString());
		dto.setPass(map.get("userEmail").toString());
		dto.setUserType("naver");

		return dto;
	}
}