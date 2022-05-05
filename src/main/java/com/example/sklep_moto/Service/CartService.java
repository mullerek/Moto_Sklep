package com.example.sklep_moto.Service;

import com.example.sklep_moto.*;
import com.example.sklep_moto.Repository.CartItemRepository;
import com.example.sklep_moto.Repository.ProduktyRepository;
import com.example.sklep_moto.Repository.ZamowieniaProduktyRepository;
import com.example.sklep_moto.Repository.ZamowieniaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@Transactional
public class CartService {

    @Autowired
    private ZamowieniaRepository zamowieniaRepository;
    @Autowired
    private CartItemRepository cartItemRepository;
    @Autowired
    private ZamowieniaProduktyRepository zamowieniaProduktyRepository;
    @Autowired
    private ProduktyRepository produktyRepository;

    public List<CartItem> listCartItems(User user) {
        return cartItemRepository.findByUser(user);
    }

    public Integer addProduct(Integer productId, Integer quantity, User user) {
        Integer addQuantity = quantity;

        Produkty produkty = produktyRepository.findById(productId).get();

        CartItem cartItem = cartItemRepository.findByUserAndProdukt(user, produkty);

        if (cartItem != null) {
            addQuantity = cartItem.getQuantity() + quantity;
            cartItem.setQuantity(addQuantity);
        } else
        {
            cartItem = new CartItem();
            cartItem.setQuantity(quantity);
            cartItem.setUser(user);
            cartItem.setProdukt(produkty);
        }

        cartItemRepository.save(cartItem);

        return addQuantity;
    }

    public String makeNewOrder( String platnosc, double wartosc_dostawy, String dostawa)
    {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime now = LocalDateTime.now();
        Zamowienia zamowienia = new Zamowienia();
        String temp_date = now.format(dtf);
        LocalDateTime date = LocalDateTime.now().parse(temp_date,dtf);
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        List<CartItem> cartItems  = listCartItems(user);

        double suma = 0;
        for(int i=0; i<cartItems.size(); i++)
        {
            suma = (float) (suma+ cartItems.get(i).getProdukt().getCena() * cartItems.get(i).getQuantity());

        }
        suma += wartosc_dostawy;
        suma = (double) Math.round(suma*100.0)/100.0;

        zamowienia.setUser(user);
        zamowienia.setData_zamowienia(date);
        zamowienia.setCzy_zrealizowano("Przyjęto");
        zamowienia.setRodzaj_platnosci(platnosc);
        zamowienia.setWartosc_zamowienia(suma);
        zamowienia.setRodzaj_dostawy(dostawa);

        zamowieniaRepository.save(zamowienia);

        return "Zamownienie zostało przyjęte";
    }

    public String saveProductsFromCart(Produkty produkty, Integer ilosc)
    {
        Zamowienia_Produkty zamowienia_produkty  = new Zamowienia_Produkty();
        Zamowienia zamowienia = zamowieniaRepository.findIdZamowienia();
        zamowienia_produkty.setProdukty(produkty);
        zamowienia_produkty.setZamowienia(zamowienia);
        zamowienia_produkty.setIlosc(ilosc);
        zamowieniaProduktyRepository.save(zamowienia_produkty);

        return "dodano do bazy";
    }

    public void clearCart()
    {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        cartItemRepository.deleteAllCartItem(user.getId_user());
    }

    public double updateQuantity(Integer productId, Integer quantity, User user)
    {
        cartItemRepository.updateQuantity(quantity,productId,user.getId_user());
        System.out.println("Update: " + quantity + " " + productId);
        Produkty produkty = produktyRepository.findById(productId).get();

        double subTotal = produkty.getCena()* quantity;

        return subTotal;
    }

    public void removeCartItem(Integer productId, User user)
    {
        cartItemRepository.deleteCartItem(user.getId_user(),productId);
    }
}
