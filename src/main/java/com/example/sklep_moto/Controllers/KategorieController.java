package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.Kategorie;

import com.example.sklep_moto.Service.KategorieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class KategorieController {

    @Autowired
    KategorieService kategorieService;

    @RequestMapping("/kategorie")
    public String showReadContactPage(Model model) {
        model.addAttribute("kategorie", kategorieService.findAll());
        return "kategorie";
    }

    @RequestMapping("/create-kategorie")
    public String showCreateContactPage(Model model) {
        model.addAttribute("command", new Kategorie());
        return "createkategorie";
    }

    @RequestMapping(value = "/create-kategorie", method = RequestMethod.POST)
    public String createKategoria(@ModelAttribute("kategorie") Kategorie kategorie) {
        kategorieService.saveKategorie(kategorie);
        return "redirect:/kategorie";
    }

    @RequestMapping(value = "/update-kategorie/{id}")
    public String showUpdateContactPage(@PathVariable int id, Model model) {
        model.addAttribute("id_kategoria", id);
        model.addAttribute("command", kategorieService.findById(id).orElse(null));
        return "updatekategorie";
    }

    @RequestMapping(value = "/update-kategorie/{id}", method = RequestMethod.POST)
    public String updateProdukty(@PathVariable int id, @ModelAttribute("kategorie") Kategorie kategorie) {
        kategorieService.updateKategorie(id, kategorie);
        return "redirect:/kategorie";
    }

}
