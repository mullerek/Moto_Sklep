package com.example.sklep_moto.Controllers;


import com.example.sklep_moto.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.Principal;
import java.util.Collection;
import java.util.Optional;

@ControllerAdvice
public class UserController {
    @ModelAttribute("username")
    public String username(Principal principal)
    {
        return principal ==null ? null : principal.getName();
    }

    @ModelAttribute("rola")
    public String rola(Principal principal)
    {
        String rola="";
        if(principal != null)
        {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            rola = user.getRole();
            System.out.println(rola);
        }

        return principal == null ? null : rola;
    }



}
