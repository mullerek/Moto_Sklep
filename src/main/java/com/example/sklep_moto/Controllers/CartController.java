package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.CartItem;
import com.example.sklep_moto.Produkty;
import com.example.sklep_moto.Security.UserDetailsService;
import com.example.sklep_moto.Service.CartService;
import com.example.sklep_moto.Service.ProduktyService;
import com.example.sklep_moto.Service.UserService;
import com.example.sklep_moto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private UserDetailsService userDetailsService;


    @GetMapping("/cart")
    public String showCart(Model model, @AuthenticationPrincipal Authentication authentication) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        List<CartItem> cartItems  = cartService.listCartItems(user);

        float suma = 0;
        for(int i=0; i<cartItems.size(); i++)
        {
            suma = (float) (suma+ cartItems.get(i).getProdukt().getCena() * cartItems.get(i).getQuantity());
        }

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("suma" , suma);

        return "cart";
    }
}