package com.example.sklep_moto;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeResource {

    @GetMapping("/home")
    public String home()
    {
        return("<h1>Welcome</h1>");
    }


    @GetMapping("/admin")
    public String admin()
    {
        return ("<h1>Welcome admin</h1>");
    }


}
