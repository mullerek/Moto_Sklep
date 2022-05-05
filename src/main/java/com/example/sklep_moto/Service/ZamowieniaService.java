package com.example.sklep_moto.Service;

import com.example.sklep_moto.Produkty;
import com.example.sklep_moto.Repository.ZamowieniaRepository;
import com.example.sklep_moto.Zamowienia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ZamowieniaService {

    @Autowired
    ZamowieniaRepository zamowieniaRepository;

    public List<Zamowienia> findAllOrders () {return zamowieniaRepository.findAll();}

    public Optional<Zamowienia> findById(int id) {
        return zamowieniaRepository.findById(id);
    }

    public Zamowienia updateStatus(int id, Zamowienia zamowienia) {
        Zamowienia updateZamowienia = zamowieniaRepository.findById(id).orElse(null);
        updateZamowienia.setCzy_zrealizowano(zamowienia.getCzy_zrealizowano());

        return zamowieniaRepository.save(updateZamowienia);
    }
}
