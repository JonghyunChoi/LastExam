package com.it.spring.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class UserListDTO {
    @NotBlank(message = "아이디를 입력해주세요.")
    @Size(min = 5, max = 20, message = "아이디는 5~20자의 영문 소문자, 숫자만 사용할 수 있습니다.")
    private String name;
    @NotBlank(message = "비밀번호를 입력해주세요.")
    @Size(min = 8, max = 16, message = "비밀번호는 8~16자 영문 대소문자, 숫자, 특수문자만 사용할 수 있습니다.")
    private String password;
    private String authority;
    private int enabled;
}