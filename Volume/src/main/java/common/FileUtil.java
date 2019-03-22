package common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUtil {
	@Autowired static ServletContext servletContext;
	//파일 업로드
	/*
	 request객체와 파일이 저장될 물리적 경로를 매개변수로 받아서
	 파일을 업로드하여 서버에 저장하고
	 MultipartRequest 객체를 반환한다.
	*/
	public static MultipartRequest upload(
			HttpServletRequest req, 
			String saveDirectory) {
		
		MultipartRequest mr = null;
		
		try {
			//해당 객체의 생성 만으로도 파일 업로드는 완료된다.
			/*
			new MultipartRequest(리퀘스트 객체, 서버의 물리적 경로,
							업로드제한용량, 캐릭셋, 파일명 중복처리);
			*/
			mr = new MultipartRequest(req, 
					saveDirectory, 1024*1024, 
					"UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mr;
	}
	
	public static void deleteFile(HttpServletRequest req, 
			String directory, String filename) {
		
		//서버의 물리적 경로 가져오기
		String saveDirectory = 
				servletContext.getRealPath(directory);
		
		/*
		파일 객체 생성 : 물리적 경로와 파일명을 연결하여 생성한다.
		*/
		File f = new File(saveDirectory+ File.separator + filename);
		//separator => os마다 경로를 표시하는 법이 다르기 때문에 경로 표시를 자동으로 변경해준다.
		
		//만약 파일이 존재한다면 삭제 처리함
		if(f.exists()){
			f.delete();
		}
	}
	

	public static void download(HttpServletRequest request, HttpServletResponse response,
			String directory, String o_filename, String s_filename){
						 
		//파일 업로드된 경로(변경이필요한부분)
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "Upload";
	
		//서버에 실제 저장된 파일명(DB처리)
		String filename = request.getParameter("s_filename");//"20140819151221.zip" ;
	
		//실제 내보낼 파일명(DB처리)
		String orgfilename = request.getParameter("o_filename");//"테스트.zip" ;
	
		InputStream in = null;
		OutputStream os = null;
		File file = null;
		boolean skip = false;
		String client = "";
	
		try{
			// 파일을 읽어 스트림에 담기
			try{
				file = new File(savePath, filename);
				in = new FileInputStream(file);
			}catch(FileNotFoundException fe){
				skip = true;
			}
	
			client = request.getHeader("User-Agent");
	
			// 파일 다운로드 헤더 지정
			response.reset() ;
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");
	
			if(!skip){
				// IE
				if(client.indexOf("MSIE") != -1){
					response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
				}else{
					// 한글 파일명 처리
					orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
				} 
				 
				response.setHeader ("Content-Length", ""+file.length() );
				
				//웹브라우저에 연결한 출력스트림 생성
				os = response.getOutputStream();
				byte b[] = new byte[(int)file.length()];
				int leng = 0;
				
				//input스트림으로 읽어서 output스트림으로 웹브라우저에 출력함
				while( (leng = in.read(b)) > 0 ){
					os.write(b,0,leng);
				}
			}else{
				System.out.println("파일을 찾을 수 없습니다");
			}
	
			in.close();
			os.close();
		}
		catch(Exception e){
			System.out.println("예외발생");
			e.printStackTrace();
		}		
	}

}
