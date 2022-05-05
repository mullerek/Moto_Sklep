package com.example.sklep_moto.Repository;

import com.example.sklep_moto.Zamowienia_Produkty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ZamowieniaProduktyRepository extends JpaRepository<Zamowienia_Produkty, Integer> {


    @Query(value =" select * from moto_sklep.zamowienia_produkty inner join moto_sklep.produkty on zamowienia_produkty.id_produktu = moto_sklep.produkty.id_produktu natural join moto_sklep.zamowienia where moto_sklep.zamowienia.id_klienta = ?1 order by moto_sklep.zamowienia.data_zamowienia desc",
            nativeQuery = true)
    List<Zamowienia_Produkty> findByUser(int id);

    @Query(value =" select * from moto_sklep.zamowienia_produkty inner join moto_sklep.produkty on zamowienia_produkty.id_produktu = moto_sklep.produkty.id_produktu natural join moto_sklep.zamowienia where moto_sklep.zamowienia.id_klienta = ?1 and moto_sklep.zamowienia.id_zamowienia = ?2 order by moto_sklep.zamowienia.data_zamowienia desc",
            nativeQuery = true)
    List<Zamowienia_Produkty> findByUserAndZid(int id,int zid);
}
