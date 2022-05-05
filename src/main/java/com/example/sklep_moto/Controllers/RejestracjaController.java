package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.Service.UserService;
import com.example.sklep_moto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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

    @RequestMapping("/user_data")
    public String showUserData(Model model)
    {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("user_data",userService.findById(user.getId_user()));


        return "/user_data";
    }


    @RequestMapping(value = "/user_data/update/{id}")
    public String showUpdateContactPage(@PathVariable int id, Model model) {
        model.addAttribute("id_user", id);
        model.addAttribute("command", userService.findUserById(id));
        return "/update_user_data";
    }

    @RequestMapping(value = "/user_data/update/{id}", method = RequestMethod.POST)
    public String updateProdukty(@PathVariable int id, @ModelAttribute("user") User user) {
        userService.updateUser(id, user);
        return "redirect:/user_data";
    }

}
