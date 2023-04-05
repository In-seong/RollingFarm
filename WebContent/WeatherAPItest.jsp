<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.json.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
	//현재 날짜 yyyyMMdd 형태로 가져오기
LocalDate currentDate = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
String formattedDate = currentDate.format(formatter);
//현재 시간 hhmm 형태로 가져오기
LocalTime now = LocalTime.now();
// 30분 뺀 시간 계산하기
LocalTime thirtyMinutesAgo = now.minusMinutes(60);
DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HHmm");
String formattedTime = thirtyMinutesAgo.format(formatter2);
//현재 시간에서 
String nx = "59"; //위도
String ny = "74"; //경도
String baseDate = formattedDate; //조회하고싶은 날짜
String baseTime = formattedTime; //조회하고싶은 시간
String type = "json"; //조회하고 싶은 type(json, xml 중 고름)
//참고문서에 있는 url주소
//초단기예보조회 1시간 전 단위로 해서 한개값만 뜨는것
String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
// 홈페이지에서 받은 키
String serviceKey = "UJzaPi4FEF%2FzrbucXYm2BuFdtujhEdkITyVTU7yID%2F4SlOAGAvKBSkXKecp%2FNZZi%2B2Jg%2Bwk09u3fOk0dFaOQqg%3D%3D";

StringBuilder urlBuilder = new StringBuilder(apiUrl);
urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); //경도
urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); //위도
urlBuilder.append(
		"&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜*/
urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "="
		+ URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode(type, "UTF-8")); /* 타입 */

/*
* GET방식으로 전송해서 파라미터 받아오기
*/
URL url = new URL(urlBuilder.toString());

HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-type", "application/json");
System.out.println("Response code: " + conn.getResponseCode());

BufferedReader rd;
if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
} else {
	rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
}

StringBuilder sb = new StringBuilder();
String line;
while ((line = rd.readLine()) != null) {
	sb.append(line);
}

conn.disconnect();
String result = sb.toString();

//JSON 파싱
JSONParser parser = new JSONParser(); // json parser 를 만들어서 문자열 데이터를 객체화 한다.
JSONObject obj = (JSONObject) parser.parse(result);
// Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
JSONObject parse_response = (JSONObject) obj.get("response");
// response 로 부터 body 찾아옵니다.
JSONObject parse_body = (JSONObject) parse_response.get("body");
// body 로 부터 items 받아옵니다.
JSONObject parse_items = (JSONObject) parse_body.get("items");

// items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다
JSONArray parse_item = (JSONArray) parse_items.get("item");
JSONObject weatherJson = new JSONObject();
for (int i = 0; i < parse_item.size(); i++) {
	JSONObject jsonObj = (JSONObject) parse_item.get(i);
	String cate = jsonObj.get("category").toString();

	switch (cate) {
	case "PTY":
		String rainForm = jsonObj.get("obsrValue").toString(); //강수형태 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
		weatherJson.put("rainForm", rainForm);
	case "REH":
		String hum = jsonObj.get("obsrValue").toString(); // 습도
		weatherJson.put("hum", hum + "%");
	case "RN1":
		String rain = jsonObj.get("obsrValue").toString(); //강수량 (mm)
		weatherJson.put("rain", rain + "mm");
	case "T1H":
		String temp = jsonObj.get("obsrValue").toString(); // 온도
		weatherJson.put("temp", temp);
	case "VEC":
		String windDir = jsonObj.get("obsrValue").toString(); //풍향 0~365도 16방위 변환식이용해서 0~16 변환
		weatherJson.put("windDir", windDir);
	case "WSD":
		String windSpd = jsonObj.get("obsrValue").toString(); //풍속 4미만 약함, 4~9 보통, 9~14 강함, 14이상 매우강함
		weatherJson.put("windSpd", windSpd);
	}
}
out.print(weatherJson);
//cate += "현재날짜"+ formattedDate+", 현재시간"+formattedTime;
rd.close();
%>

