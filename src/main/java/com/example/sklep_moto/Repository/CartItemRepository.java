package com.example.sklep_moto.Repository;

import com.example.sklep_moto.CartItem;
import com.example.sklep_moto.Produkty;
import com.example.sklep_moto.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {

    List<CartItem> findByUser(User user);

    CartItem findByUserAndProdukt(User user, Produkty produkty);

    @Query("update CartItem c set c.quantity = ?1 where c.produkt.id_produktu=?2 and c.user.id_user=?3")
    @Modifying

    void updateQuantity(Integer quantity, Integer productId, Integer customerId);

    @Query("delete from CartItem c where c.user.id_user = ?1 and c.produkt.id_produktu = ?2")
    @Modifying
    void deleteCartItem(Integer customerId, Integer productId);

    @Query("delete from CartItem c where c.user.id_user = ?1")
    @Modifying
    void deleteAllCartItem(Integer customerId);
}

