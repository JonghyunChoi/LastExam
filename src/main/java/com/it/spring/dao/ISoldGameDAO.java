package com.it.spring.dao;

import com.it.spring.dto.SoldGameDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ISoldGameDAO {
    public List<SoldGameDTO> soldList();
    public List<SoldGameDTO> soldListGetOne(String name);
    public void insertList(String name, int price, int number);
    public void updateList(String name);
    public void refundList(String name);
    public void deleteList(String name);
}
