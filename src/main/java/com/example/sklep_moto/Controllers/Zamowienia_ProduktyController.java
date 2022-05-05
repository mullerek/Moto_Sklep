package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.Service.Zamowienia_ProduktyService;
import com.example.sklep_moto.User;
import com.example.sklep_moto.Zamowienia_Produkty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class Zamowienia_ProduktyController {

    @Autowired
    Zamowienia_ProduktyService zamowienia_produktyService;

    @GetMapping("/zamowienia_user")
    public String showOrdered(Model model, @AuthenticationPrincipal Authentication authentication) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        List<Zamowienia_Produkty> zamowione  = zamowienia_produktyService.listOrderedProducts(user);


        model.addAttribute("zamowione", zamowione);

        return "zamowienia_user";
    }
}
