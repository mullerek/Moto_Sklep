package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.Service.ProduktyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class DaneProduktyController {

    @Autowired
    ProduktyService produktyService;

    @PostMapping( "/wyszukaj")
    public String showSzukaneProdukty(@RequestParam String slowo, Model model)
    {
        model.addAttribute("wyszukane", produktyService.findAllSzukane(slowo));
        return "wyszukane";
    }

    @RequestMapping( "/prox")
    public String showProxProducts(Model model)
    {
        model.addAttribute("wyszukane", produktyService.findAllSzukane("prox"));
        return "wyszukane";
    }

    @RequestMapping( "/fox")
    public String showFoxProducts(Model model)
    {
        model.addAttribute("wyszukane", produktyService.findAllSzukane("fox"));
        return "wyszukane";
    }

    @RequestMapping(value = "/produkt-spec/{id}")
    public String showUpdateOdziezPage(@PathVariable int id, Model model) {
        model.addAttribute("id_produktu", id);
        model.addAttribute("odziez", produktyService.findById(id).orElse(null));
        return "produkt-spec";
    }

    @RequestMapping("/produkty_wg_kat/{katid}")
    public String showOlejePlynyPage(Model model,@PathVariable String katid) {
        int kat_id = Integer.parseInt(katid);
        model.addAttribute("produkty", produktyService.findAllProducts(kat_id));
        return "produkty_wg_kat";
    }


}
