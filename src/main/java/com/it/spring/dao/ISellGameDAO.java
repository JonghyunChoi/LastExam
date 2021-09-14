package com.it.spring.dao;

import com.it.spring.dto.SellGameDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ISellGameDAO {
    public List<SellGameDTO> gameList();
    public void sell(String name);
    public void refund(String name);
}
