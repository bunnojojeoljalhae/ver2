<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
    <style type="text/css">
    	img {
    		 height : 30px;
    		 width : auto; 
    	}
    </style>
  </head>
  <body>
  <%
    String clientId = "H4k0lTcgvFCT8K_l8lp5";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/honbab/member/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  </body>
</html>