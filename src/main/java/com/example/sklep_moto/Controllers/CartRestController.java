package com.example.sklep_moto.Controllers;

import com.example.sklep_moto.CartItem;
import com.example.sklep_moto.SendMail;
import com.example.sklep_moto.Service.CartService;
import com.example.sklep_moto.Service.ProduktyService;
import com.example.sklep_moto.Service.UserService;
import com.example.sklep_moto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Controller
public class CartRestController {

    @Autowired
    private CartService cartService;

    @Autowired
    private UserService userService;

    @Autowired
    ProduktyService produktyService;

    @Autowired
    SendMail sendMail;


    @RequestMapping("/cart/add")
    public String addProductToCart(@RequestParam String id,
                                   @RequestParam String qty,
                                   @AuthenticationPrincipal Authentication authentication,RedirectAttributes redirectAttributes)
    {
        Integer temp_productId = Integer.parseInt(id);
        Integer temp_quantity = Integer.parseInt(qty);

        authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || authentication instanceof AnonymousAuthenticationToken)
        {
            redirectAttributes.addFlashAttribute("message","Musisz się zalogować, aby dodać produkt do koszyka");
            return "redirect:/login";
        }

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        Integer addedQuantity = cartService.addProduct(temp_productId,temp_quantity,user);

        return "redirect:/cart";
    }

    @RequestMapping("/cart/update")
    public String updateQuantity(@RequestParam String pid,
                                   @RequestParam String qty,
                                   @RequestParam String btn,
                                   @AuthenticationPrincipal Authentication authentication)
    {
        Integer temp_productId = Integer.parseInt(pid);
        Integer temp_quantity = Integer.parseInt(qty);

        if(btn.equals("+"))
        {
            temp_quantity+=1;
        }else if(btn.equals("-")&& temp_quantity>1)
        {
            temp_quantity-=1;
        }

        authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || authentication instanceof AnonymousAuthenticationToken)
        {
            return "Muszisz sie zalogowac, aby dodać produkt do koszyka";
        }

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


        double subTotal = cartService.updateQuantity(temp_productId,temp_quantity,user);

        return "redirect:/cart";
    }

    @RequestMapping("/cart/zamow")
    public String makeOrder(@RequestParam String dostawa,
                            @RequestParam String platnosc,
                            @AuthenticationPrincipal Authentication authentication,
                            RedirectAttributes redirectAttributes) throws MessagingException {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        List<CartItem> cartItems  = cartService.listCartItems(user);




        double wartosc_dostawy = Double.parseDouble(dostawa);
        String rodzajDostawy ="";

        if(wartosc_dostawy<11)
        {
            rodzajDostawy = "Kurier DHL";
        }else if(wartosc_dostawy>11 && wartosc_dostawy<12)
        {
            rodzajDostawy = "Kurier DPD";
        }else if(wartosc_dostawy >12)
        {
            rodzajDostawy = "Poczta Polska";
        }else
        {
            rodzajDostawy = "Odbiór osobisty";
        }

        authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || authentication instanceof AnonymousAuthenticationToken)
        {
            return "Muszisz sie zalogowac, aby dodać produkt do koszyka";
        }

        String zamowione_produkty = "";

        cartService.makeNewOrder(platnosc,wartosc_dostawy,rodzajDostawy);

        for(int i=0; i<cartItems.size(); i++)
        {
            cartService.saveProductsFromCart(cartItems.get(i).getProdukt(),cartItems.get(i).getQuantity());
            produktyService.updateQuantity(cartItems.get(i).getProdukt(),cartItems.get(i).getQuantity());
            zamowione_produkty +=

                "<tr>"+
                    "<td>" + cartItems.get(i).getProdukt().getNazwa_produktu() + "</td>" +
                    "<td>" + cartItems.get(i).getQuantity() + "</td>"+
                    "<td>" + cartItems.get(i).getProdukt().getCena() + "</td>" +
                "</tr>";


        }
        cartService.clearCart();

        sendMail.sendMail(user.getEmail(),"Dziekujemy za zakupy w naszym sklepiej",zamowione_produkty);

        redirectAttributes.addFlashAttribute("message","Zamówienie zrealizowano pomyślnie");

        return "redirect:/Glowna";
    }

    @RequestMapping("/cart/remove/{pid}")
    public String removeCartItem(@PathVariable String pid,
                                 @AuthenticationPrincipal Authentication authentication)
    {
        Integer temp_productId = Integer.parseInt(pid);

        authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || authentication instanceof AnonymousAuthenticationToken)
        {
            return "Muszisz sie zalogowac, aby dodać produkt do koszyka";
        }

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


        cartService.removeCartItem(temp_productId,user);

        return "redirect:/cart";
    }

}
