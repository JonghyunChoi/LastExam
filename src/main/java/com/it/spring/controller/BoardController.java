package com.it.spring.controller;

import com.it.spring.dao.ISimpleBbsDAO;
import com.it.spring.dto.SimpleBbsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    ISimpleBbsDAO bbsDAO;

    @RequestMapping("/list")
    public String postList(Model model) {
        List<SimpleBbsDTO> carrier = bbsDAO.postList();
        model.addAttribute("carrier", carrier);

        return "board/postList";
    }

    @RequestMapping("/view")
    public String postView(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        bbsDAO.plusViewCount(Integer.parseInt(id)); // 조회수 증가

        SimpleBbsDTO bbsDTO = bbsDAO.postView(id);
        model.addAttribute("bbsDTO", bbsDTO);

        return "board/postView";
    }

    @RequestMapping("/write")
    public String postWrite() {

        return "board/postWrite";
    }

    @RequestMapping("/delete")
    public String postDelete(HttpServletRequest request) {
        String id = request.getParameter("id");
        bbsDAO.postDelete(id);

        return "redirect:/board/list";
    }

    @RequestMapping("/update")
    public String postUpdate(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        SimpleBbsDTO bbsDTO = bbsDAO.postView(id);

        model.addAttribute("id", bbsDTO.getId());
        model.addAttribute("title", bbsDTO.getTitle());
        model.addAttribute("content", bbsDTO.getContent());

        return "board/postUpdate";
    }


    @RequestMapping("/postUpdate")
    public String postUpdateProcess(HttpServletRequest request,
                                    @ModelAttribute("dto") @Valid SimpleBbsDTO bbsDTO,
                                    BindingResult result,
                                    Model model)
    {
        String id = request.getParameter("id");

        if (result.hasErrors()) {
            // 글 작성 시 입력 칸이 비어있거나 제한을 벗어났을 경우
            postErrorProcess(request, result, model);
            model.addAttribute("id", id);

            return "/board/postUpdate";
        } else {
            id = request.getParameter("id");
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            bbsDAO.postUpdate(Integer.parseInt(id), title, content);

            return "redirect:/board/list";
        }
    }

    @RequestMapping("/postWrite")
    public String postUpload(HttpServletRequest request,
                             @ModelAttribute("dto") @Valid SimpleBbsDTO bbsDTO,
                             BindingResult result,
                             Model model)
    {
        if (result.hasErrors()) {
            // 글 작성 시 입력 칸이 비어있거나 제한을 벗어났을 경우
            postErrorProcess(request, result, model);

            return "/board/postWrite";
        } else {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String writer = request.getParameter("writer");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String regdate = dateFormat.format(System.currentTimeMillis());
            int count = 0;

            bbsDAO.postWrite(writer, title, content, regdate, count);

            return "redirect:/board/list";
        }
    }

    private void postErrorProcess(HttpServletRequest request, BindingResult result, Model model) {
        String title_errorMsg;
        String title;
        String content;
        String content_errorMsg;

        if (result.getFieldError("title") != null) {
            // title error
            title_errorMsg = result.getFieldError("title").getDefaultMessage();
            title = request.getParameter("title");
            content = request.getParameter("content");
            System.out.println(title_errorMsg);
            model.addAttribute("title_error_message", title_errorMsg);
            model.addAttribute("title", title);
            model.addAttribute("content", content);
        }

        if (result.getFieldError("content") != null) {
            // content error
            content_errorMsg = result.getFieldError("content").getDefaultMessage();
            title = request.getParameter("title");
            content = request.getParameter("content");
            System.out.println(content_errorMsg);
            model.addAttribute("content_error_message", content_errorMsg);
            model.addAttribute("title", title);
            model.addAttribute("content", content);
        }
    }
}
