package com.it.spring.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class SimpleBbsDTO {
    private int id;
    private String writer;
    @NotBlank(message = "제목을 입력해주세요.")
    private String title;
    @NotBlank(message = "내용을 입력해주세요.")
    private String content;
    private String regdate;
    private int count;
}
