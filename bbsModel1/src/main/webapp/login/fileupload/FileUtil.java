package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	public static String uploadFile(HttpServletRequest req, String directory) throws ServletException, IOException {
		//원래 저장한 파일 이름 갖고옴
		
		
		Part part = req.getPart("file"); //file.jsp에서 file 태그 이름
		
		String pHeader = part.getHeader("content-disposition");
		System.out.println("pHeader : " + pHeader);
		
		String[] arrPartHeader = pHeader.split("filename=");
		String orgFileName = arrPartHeader[1].trim().replace("\"", "");
		
		if (!orgFileName.isEmpty()) {
			part.write(directory + File.separator + orgFileName);
		}
		
		return orgFileName;
	}
	
	public static String renameFile (String directory, String fileName) {
		// 새로운 파일 이름
		
		String ext = fileName.substring(fileName.lastIndexOf("."));	//확장자 기준으로 잘라
		String now = new SimpleDateFormat("yyyyMMdd_Hms").format(new Date()); //원래파일명_시분초 해주는게 더 좋아
		String newFileName = now + ext;
		
		File oldFile = new File(directory + File.separator + fileName);
		File newFile = new File(directory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
	
	public static ArrayList<String> uploadFile2 (HttpServletRequest req, String directory) throws ServletException, IOException {
		ArrayList<String> listFiles = new ArrayList<>();
		
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			if (!part.getName().equals("file")) continue;
			
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader=" + partHeader);
			
			String[] arrPartHeader = partHeader.split("filename=");
			String orgFileName = arrPartHeader[1].trim().replace("\"", "");
			System.out.println("orgFileName : " + orgFileName);
			
			if (!orgFileName.isEmpty()) {
				part.write(directory + File.separator + orgFileName);
			}
			
			listFiles.add(orgFileName);
		}
		
		return listFiles;
	}
}
