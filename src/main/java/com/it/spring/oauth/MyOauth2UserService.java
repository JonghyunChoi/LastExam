package com.it.spring.oauth;

import com.it.spring.auth.MyDetails;
import com.it.spring.dao.IUserListDAO;
import com.it.spring.dto.UserListDTO;
import com.it.spring.oauth.provider.GoogleUserInfo;
import com.it.spring.oauth.provider.NaverUserInfo;
import com.it.spring.oauth.provider.OAuth2UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MyOauth2UserService extends DefaultOAuth2UserService {
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private IUserListDAO dao;
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		OAuth2User oAuth2User = super.loadUser(userRequest);
		System.out.println("getAttributes: " + oAuth2User.getAttributes());
		// google getAttributes: {sub=113897591863927336286, name=최종현, given_name=종현, family_name=최, picture=https://lh3.googleusercontent.com/a/AATXAJwJ5y5Ji3xdYl8MeCna_HCwhKe-_bGK0Mdu2cJsgw=s96-c, email=chlwhdgus86@gmail.com, email_verified=true, locale=ko}
		// naver  getAttributes: {resultcode=00, message=success, response={id=l2TP-KWKCxjJKfJ0fJm7cthhxLOOvnv4DK50xqX-JOo, nickname=종현, email=chlwhdgus86@naver.com}}
		
		OAuth2UserInfo oAuth2UserInfo = null;
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("구글 로그인 요청...");
			oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
		} else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			System.out.println("네이버 로그인 요청...");
			oAuth2UserInfo = new NaverUserInfo((Map)oAuth2User.getAttributes().get("response"));
		} else {
			System.out.println("우리는 구글과 네이버만 지원합니다...");
		}
		
		String provider = oAuth2UserInfo.getProvider();
		String providerID = oAuth2UserInfo.getProviderId();
		String username = provider + "_" + providerID;
		//String password = passwordEncoder.encode("park");
		String email = oAuth2UserInfo.getEmail();
		String role = "ROLE_USER";
		
		System.out.println("provider: " + provider);
		System.out.println("providerID: " + providerID);
		System.out.println("username: " + username);
		//System.out.println("password: " + password);
		System.out.println("email: " + email);
		
		UserListDTO dto = null;
		List<UserListDTO> list = dao.getUser(username.substring(0, 20));
		if(list.size() == 0) {
			System.out.println("sns로 로그인이 최초입니다.");
			dto = new UserListDTO();
			dto.setName(username.substring(0, 20));
			dto.setPassword("111");
			dto.setAuthority("ROLE_USER");
			dto.setEnabled(1);
			
			dao.saveUser(dto);
		} else {
			dto = list.get(0);
			System.out.println("sns 로그인 기록이 있습니다. 당신은 회원으로 가입되어 있습니다.");
		}
		
		return new MyDetails(dto, oAuth2User.getAttributes());
	}
}









