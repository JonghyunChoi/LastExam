package com.it.spring.auth;

import com.it.spring.dto.UserListDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

public class MyDetails implements UserDetails, OAuth2User {
	
	private UserListDTO userListDTO;
	private Map<String, Object> attributes;
	
	public MyDetails(UserListDTO userListDTO) {
		this.userListDTO = userListDTO;
	}

	public MyDetails(UserListDTO userListDTO, Map<String, Object> attributes) {
		this.userListDTO = userListDTO;
		this.attributes = attributes;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collectors = new ArrayList<>();
		collectors.add( ()-> {
			return userListDTO.getAuthority();
		});
		
		return collectors;
	}

	@Override
	public String getPassword() {
		return userListDTO.getPassword();
	}

	@Override
	public String getUsername() {
		return userListDTO.getName();
	}

	@Override
	public boolean isAccountNonExpired() {

		return true;
	}

	@Override
	public boolean isAccountNonLocked() {

		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {

		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return true;
	}

	@Override
	public Map<String, Object> getAttributes() {
		return null;
	}

	@Override
	public String getName() {
		return null;
	}
}
