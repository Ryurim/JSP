package common;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//쿠키 생성하는 자바 클래스 파일!
//얘는 자바빈이 될 수 없어. 왜? 메서드들이 static 이라서 객체 만들어서 쓸 필요가 없어서 기본 생성자 안만들어 줬기 때문!
//필드에서는 게터세터 안만들어.프레임웍이 게터 세터 알아서 생성해 주기 때문에
public class CookieUtil {
	public static void setCookies(HttpServletResponse resp, String domain, String path, int expire, String name, String val) {
		Cookie cookieLogin = new Cookie(name, val);
		if (domain != null && !domain.isEmpty()) {
			cookieLogin.setDomain(domain);
		}
		cookieLogin.setPath((path != null && !path.isEmpty()) ? path : "/");
		cookieLogin.setMaxAge(expire);
		resp.addCookie(cookieLogin);
	}
	public static String getCookieInfo(HttpServletRequest req, String name) {
		String result = "";
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (name.equals(c.getName())) {
					result = c.getValue();
				
				break;
				}
			}
		}
		return result;
	}
	//setDeleteCookie(response, "", "/", 0, 쿠키이름, ""); 이렇게 호출하면 삭제 완료!
	public static void setDeleteCookie(HttpServletResponse resp, String domain, String path, int expire, String name, String val) {
		setCookies(resp, domain, path, expire, name, val);
	}
}
