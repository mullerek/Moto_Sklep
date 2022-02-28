package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.Service.UserService;
import com.example.sklep_moto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RejestracjaController {
    @Autowired
    UserService userService;

    @RequestMapping("/rejestracja")
    public String ShowRegistryForm(Model model) {
        model.addAttribute("command", new User());
        return "rejestracja";
    }

    @RequestMapping(value = "/zarejestruj", method = RequestMethod.POST)
    public String createUser(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
        userService.saveUser(user);
        redirectAttributes.addFlashAttribute("message","Rejestracja przebiegła pomyślnie");

        return "redirect:/Glowna";
    }
}
