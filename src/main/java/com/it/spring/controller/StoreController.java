package com.it.spring.controller;

import com.it.spring.dao.ISellGameDAO;
import com.it.spring.dao.ISoldGameDAO;
import com.it.spring.dto.SellGameDTO;
import com.it.spring.dto.SoldGameDTO;
import com.it.spring.service.IBuyGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    ISellGameDAO sellGameDAO;
    @Autowired
    ISoldGameDAO soldGameDAO;

    @Autowired
    IBuyGameService buyGameService;

    @RequestMapping("/list")
    public String storeList(Model model) {
        List<SellGameDTO> sellGameCarrier = sellGameDAO.gameList();
        model.addAttribute("sellGameCarrier", sellGameCarrier);

        List<SoldGameDTO> soldGameCarrier = soldGameDAO.soldList();
        model.addAttribute("soldGameCarrier", soldGameCarrier);

        return "store/store";
    }

    @RequestMapping("/buyProcess")
    public String buyProcess(HttpServletRequest request) {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String number = request.getParameter("number");
        buyGameService.buy(name, Integer.parseInt(price), Integer.parseInt(number));

        return "redirect:/store/list";
    }

    @RequestMapping("/refundProcess")
    public String refundProcess(HttpServletRequest request) {
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        buyGameService.refund(name, Integer.parseInt(number));

        return "redirect:/store/list";
    }
}

















