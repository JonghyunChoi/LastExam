package com.it.spring.controller;

import com.it.spring.dao.IUserListDAO;
import com.it.spring.dto.UserListDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    BCryptPasswordEncoder pwdEncoder;

    @Autowired
    IUserListDAO userDAO;

    @RequestMapping("/joinUser") // 회원가입 처리
    public String joinUser(Model model,
                           HttpServletRequest request,
                           @ModelAttribute("dto") @Valid UserListDTO userListDTO,
                           BindingResult result) {
        String name_errorMsg = "";
        String pwd_errorMsg = "";

        if (result.hasErrors()) {
            // 회원가입 시 입력 칸이 비어있거나 제한을 벗어났을 경우
            if (result.getFieldError("name") != null) {
                // id error
                name_errorMsg = result.getFieldError("name").getDefaultMessage();
                System.out.println(name_errorMsg);
                model.addAttribute("name_error_message", name_errorMsg);
            }

            if (result.getFieldError("password") != null) {
                // password error
                pwd_errorMsg = result.getFieldError("password").getDefaultMessage();
                System.out.println(pwd_errorMsg);
                model.addAttribute("pwd_error_message", pwd_errorMsg);
            }

            return "security/joinForm";
        } else {
            // 회원가입 문제가 없을 경우
            String name = request.getParameter("name");
            List<UserListDTO> userDataList = userDAO.getUser(name);
            String pwd = pwdEncoder.encode(request.getParameter("password"));
            String auth = "ROLE_USER";
            int enabled = 1;

            if (userDataList.size() != 0) {
                if (userDataList.get(0).getName().equals(name)) {
                    // 중복 처리
                    name_errorMsg = "중복된 아이디입니다.";
                    System.out.println(name_errorMsg);
                    model.addAttribute("name_error_message", name_errorMsg);

                    return "security/joinForm";
                }
            }

            // 중복이 아닐 경우
            UserListDTO userDTO = new UserListDTO();
            userDTO.setName(name);
            userDTO.setPassword(pwd);
            userDTO.setAuthority(auth);
            userDTO.setEnabled(enabled);

            userDAO.saveUser(userDTO);

            return "redirect:/login";
        }
    }
}





