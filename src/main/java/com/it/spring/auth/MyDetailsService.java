package com.it.spring.auth;

import com.it.spring.dao.IUserListDAO;
import com.it.spring.dto.UserListDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyDetailsService implements UserDetailsService {
	
	@Autowired
	IUserListDAO userListDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<UserListDTO> list = userListDAO.getUser(username);
		
		UserListDTO dto;
		
		if(list.size() != 0) {
			dto = list.get(0);
			System.out.println("회원맞음");
		} else {
			dto = new UserListDTO();
			System.out.println("회원아님");
		}
		
		MyDetails pd = new MyDetails(dto);
		return pd;
	}
	
}
