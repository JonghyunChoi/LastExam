package com.it.spring.dao;

import com.it.spring.dto.SimpleBbsDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ISimpleBbsDAO {
    public List<SimpleBbsDTO> postList();
    public SimpleBbsDTO postView(String id);
    public void plusViewCount(int id);
    public void postWrite(String writer, String title, String content, String regdate, int count);
    public void postUpdate(int id, String title, String content);
    public void postDelete(String id);
}
