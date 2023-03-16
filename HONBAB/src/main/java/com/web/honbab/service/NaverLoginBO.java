package com.web.honbab.service;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {
	
	public final static String CLIENT_ID = "LrTCwPDTXn77SwFIEJd9";
	public final static String CLIENT_SECRET = "JQDeg0TxZy";
	public final static String REDIRECT_URI = "http://localhost:8080/honbab/member/callback";
//	public final static String REDIRECT_URI = "http://localhost:8080/honbab/naver_login/callback";
	public final static String SESSION_STATE = "oauth_state";
	public final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	public final static String GET_USER_PROFILE = "https://openapi.naver.com/v1/nid/getUserProfile";

	public String getAuthorizationUrl(HttpSession session) {
	    /* 세션 유효성 검증을 위하여 난수를 생성 */
        String state = generateRandomString();
        /* 생성한 난수 값을 session에 저장 */
        setSession(session,state);       
        OAuth20Service oauthService = new ServiceBuilder()
        		.apiKey(CLIENT_ID)
        		.apiSecret(CLIENT_SECRET)
        		.callback(REDIRECT_URI)
        		.state(state)
        		.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		String sessionState = getSession(session);
		   if(StringUtils.pathEquals(sessionState, state)){
			   
	            OAuth20Service oauthService = new ServiceBuilder()
	                    .apiKey(CLIENT_ID)
	                    .apiSecret(CLIENT_SECRET)
	                    .callback(REDIRECT_URI)
	                    .state(state)
	                    .build(NaverLoginApi.instance());
	 
	            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
	            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
	            return accessToken;
	        }
		return null;
	}
	
	/* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

	public void setSession(HttpSession session, String state) {
		 session.setAttribute(SESSION_STATE, state); 
	}

	public String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
	    OAuth20Service oauthService = new ServiceBuilder()
	        .apiKey(CLIENT_ID)
	        .apiSecret(CLIENT_SECRET)
	        .callback(REDIRECT_URI).build(NaverLoginApi.instance());
	    
	    OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
	    oauthService.signRequest(oauthToken, request);
	    Response response = request.send();
	    
	    return response.getBody();	
	}

}
