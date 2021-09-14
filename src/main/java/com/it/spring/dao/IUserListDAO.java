package com.it.spring.dao;

import com.it.spring.dto.UserListDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IUserListDAO {
    public List<UserListDTO> getUser(String name);
    public void saveUser(UserListDTO dto);
}
