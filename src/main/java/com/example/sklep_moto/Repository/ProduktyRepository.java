package com.example.sklep_moto.Repository;

import com.example.sklep_moto.Produkty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProduktyRepository extends JpaRepository<Produkty,Integer> {
    @Query(value="select * from produkty where id_kategoria=?1",nativeQuery = true)
    public List<Produkty> findAllKaski(int kategoria);

    @Query(value = "select * from moto_sklep.produkty where upper(nazwa_produktu) LIKE CONCAT('%',UPPER(?1),'%')",nativeQuery = true)
    public List<Produkty> findAllSzukane(String slowo);

    @Query(value = "select * from moto_sklep.produkty where id_produktu=?1", nativeQuery = true)
    public List<Produkty> findProductById(int id);


}
