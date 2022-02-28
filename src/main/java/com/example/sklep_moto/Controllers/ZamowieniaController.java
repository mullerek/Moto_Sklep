package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.Repository.ZamowieniaProduktyRepository;
import com.example.sklep_moto.Service.UserService;
import com.example.sklep_moto.Service.ZamowieniaService;
import com.example.sklep_moto.Service.Zamowienia_ProduktyService;
import com.example.sklep_moto.User;
import com.example.sklep_moto.Zamowienia;
import com.example.sklep_moto.Zamowienia_Produkty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
public class ZamowieniaController {

    @Autowired
    ZamowieniaService zamowieniaService;

    @Autowired
    Zamowienia_ProduktyService zamowienia_produktyService;

    @Autowired
    UserService userService;

    @GetMapping("/zamowienia")
    public String showOrdered(Model model, @AuthenticationPrincipal Authentication authentication) {

        List<Zamowienia> zamowione  = zamowieniaService.findAllOrders();
        model.addAttribute("zamowione", zamowione);

        return "zamowienia";
    }

    @RequestMapping("/zamowienia_klient/{uid}/{zid}")
    public String showCustomerOrder(@PathVariable String uid,@PathVariable String zid,Model model, @AuthenticationPrincipal Authentication authentication) {


        Integer temp_uid = Integer.parseInt(uid);
        Integer zam_id = Integer.parseInt(zid);

        System.out.println("To jest UID:"+temp_uid);
        List<Zamowienia_Produkty> zamowione  = zamowienia_produktyService.listKlientOrderedProducts(temp_uid,zam_id);
        model.addAttribute("zamowione", zamowione);

        return "zamowienia_klient";
    }

    @RequestMapping("/dane_klienta/{uid}")
    public String schowCustomerData(@PathVariable String uid,Model model, @AuthenticationPrincipal Authentication authentication) {


        int temp_uid = Integer.parseInt(uid);

        System.out.println("To jest UID:"+temp_uid);
        List<User> dane  = userService.findById(temp_uid);
        model.addAttribute("dane", dane);

        return "dane_klienta";
    }
}
