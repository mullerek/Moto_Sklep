package com.example.sklep_moto.Controllers;


import com.example.sklep_moto.Produkty;
import com.example.sklep_moto.Service.KategorieService;
import com.example.sklep_moto.Service.ProduktyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProduktyController {

    @Autowired
    ProduktyService produktyService;
    @Autowired
    KategorieService kategorieService;

    @GetMapping("/Glowna")
    public String welcome(Model model)
    {
        return "Glowna";
    }

    @RequestMapping("/produkty")
    public String showReadContactPage(Model model) {
        model.addAttribute("produkty", produktyService.findAll());
        return "produkty";
    }


    @RequestMapping("/create-produkty")
    public String showCreateContactPage(Model model) {
        model.addAttribute("listaKat", kategorieService.findAll());
        model.addAttribute("command", new Produkty());
        return "createprodukty";
    }

    @RequestMapping(value = "/create-produkty", method = RequestMethod.POST)
    public String createContact(@ModelAttribute("produkty") Produkty produkty) {
        produktyService.saveProdukty(produkty);
        return "redirect:/produkty";
    }



    @RequestMapping(value = "/update-produkty/{id}")
    public String showUpdateContactPage(@PathVariable int id, Model model) {
        model.addAttribute("id_produktu", id);
        model.addAttribute("command", produktyService.findById(id).orElse(null));
        return "updateprodukty";
    }

    @RequestMapping(value = "/update-produkty/{id}", method = RequestMethod.POST)
    public String updateProdukty(@PathVariable int id, @ModelAttribute("produkty") Produkty produkty) {
        produktyService.updateProdukty(id, produkty);
        return "redirect:/produkty";
    }

    @RequestMapping(value = "/delete-produkty/{id}")
    public String deleteContact(@PathVariable int id) {
        produktyService.deleteById(id);
        return "redirect:/produkty";
    }
}
