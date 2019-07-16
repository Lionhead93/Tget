<!-- 캡차API 로직을 처리하는 JSP-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%!
    String clientId = "09QL9rhEvTm5Zcy_oNaN"; //애플리케이션 클라이언트 아이디값";
	String clientSecret = "G5d3gC1oHK"; //애플리케이션 클라이언트 시크릿값";

	public String captchaNkey() {
		String result = null;
		try {
			String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				sb.append(inputLine);
			}
			br.close();
			result = sb.toString().substring(8, 8 + 16);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	public String captchaImage(String key, String dirPath) {
		String result = null;
		try {
			//String key = "CAPTCHA_KEY"; // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
			String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				// 랜덤한 이름으로 파일 생성
				//dirPath="C:\\Users\\Clark\\workspace\\ajax\\WebContent\\captchaImage\\";
				String tempname = Long.valueOf(new Date().getTime()).toString();
				File f = new File(dirPath + tempname + ".jpg");
				f.createNewFile();
				OutputStream outputStream = new FileOutputStream(f);
				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				result = tempname + ".jpg";
				outputStream.close();
				is.close();
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				String inputLine;
				StringBuffer sb = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					sb.append(inputLine);
				}
				br.close();
				System.out.println(sb.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	public String captchaNkeyResult(String key, String value) {
		String result=null;
		try {
			String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
			//String key = "CAPTCHA_KEY"; // 캡차 키 발급시 받은 키값
			//String value = "USER_VALUE"; // 사용자가 입력한 캡차 이미지 글자값
			System.out.println("key >>> " + key + " value >>> " + value);
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value="
					+ value;

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				sb.append(inputLine);
			}
			br.close();
			System.out.println(sb.toString());
			result=sb.toString().substring(10,14);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}%>
<%
	String dirPath = request.getServletContext().getRealPath("captchaImage") + "\\";
	System.out.println(dirPath);
	
	String captchaImageName = null;
	String result=null;
	//System.out.println(captchaImageName);
	String key = request.getParameter("key");
	String value = request.getParameter("value");

	if (value != null) {
		result=this.captchaNkeyResult(key, value);
		System.out.println("result>>>"+result);
	} else {
		key = this.captchaNkey();
		captchaImageName = this.captchaImage(key, dirPath);
		//result = "<img src=\"captchaImage/" + captchaImageName + "\">"+key;
		result = "{\"key\":\""+key+"\", \"captchaImageName\":\""+captchaImageName+"\"}";
		System.out.println("result>>>"+result);
	}
	 
%>
<%=result%>