package com.example.sklep_moto.Repository;

import com.example.sklep_moto.Produkty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;

public interface ProduktyRepository extends JpaRepository<Produkty,Integer> {

    @Query(value="select * from produkty where id_kategoria=?1",nativeQuery = true)
    List<Produkty> findAllByKat(int kategoria);

    @Query(value = "select * from moto_sklep.produkty where upper(nazwa_produktu) LIKE CONCAT('%',UPPER(?1),'%')",nativeQuery = true)
    List<Produkty> findAllSzukane(String slowo);

    @Query(value = "select * from moto_sklep.produkty where id_produktu=?1", nativeQuery = true)
    List<Produkty> findProductById(int id);


}
