package com.example.sklep_moto.Controllers;


import com.example.sklep_moto.Service.UserService;
import com.example.sklep_moto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import java.security.Principal;


@ControllerAdvice
public class UserController {
    @Autowired
    UserService userService;

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
