package com.it.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

    @RequestMapping("/") // 메인 화면
    public String root() {
        return "index";
    }

    @RequestMapping("/login") // 로그인 화면으로
    public String loginForm() {
        return "security/loginForm";
    }

    @RequestMapping("/join") // 회원가입 화면으로
    public String joinForm() { return "security/joinForm"; }
}












