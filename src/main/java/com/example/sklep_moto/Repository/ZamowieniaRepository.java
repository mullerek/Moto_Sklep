package com.example.sklep_moto.Repository;

import com.example.sklep_moto.Produkty;
import com.example.sklep_moto.Zamowienia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ZamowieniaRepository extends JpaRepository<Zamowienia,Integer> {
    @Query(value="select * from moto_sklep.zamowienia order by id_zamowienia desc limit 1",nativeQuery = true)
    public Zamowienia findIdZamowienia();
}
