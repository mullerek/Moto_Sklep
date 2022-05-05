package com.example.sklep_moto.Service;


import com.example.sklep_moto.Produkty;
import com.example.sklep_moto.Repository.ProduktyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProduktyService {

    @Autowired
    private ProduktyRepository produktyRepository;

    public List<Produkty> findAll() {
        return produktyRepository.findAll();
    }

    public List<Produkty> findAllSzukane(String slowo) {return produktyRepository.findAllSzukane(slowo);}

    public List<Produkty> findAllProducts(int kategoria) {return produktyRepository.findAllByKat(kategoria);}

    public Optional<Produkty> findById(int id) {
        return produktyRepository.findById(id);
    }

    public List<Produkty> findProductById(int id) {
        return produktyRepository.findProductById(id);
    }

    public Produkty saveProdukty(Produkty produkty) {
        return produktyRepository.save(produkty);
    }

    public Produkty updateProdukty(int id, Produkty produkty) {
        Produkty updateProdukty = produktyRepository.findById(id).orElse(null);
        updateProdukty.setId_kategoria(produkty.getId_kategoria());
        updateProdukty.setNazwa_produktu(produkty.getNazwa_produktu());
        updateProdukty.setProducent(produkty.getProducent());
        updateProdukty.setOpis(produkty.getOpis());
        updateProdukty.setRozmiar(produkty.getRozmiar());
        updateProdukty.setIlosc(produkty.getIlosc());
        updateProdukty.setCena(produkty.getCena());
        updateProdukty.setZdjecie(produkty.getZdjecie());
        return produktyRepository.save(updateProdukty);
    }

    public void deleteById(int id) {
        produktyRepository.deleteById(id);
    }

    public Produkty updateQuantity(Produkty produkty, Integer ilosc)
    {
        Produkty updateProdukty = produktyRepository.findById(produkty.getId_produktu()).orElse(null);
        int quant = updateProdukty.getIlosc()-ilosc;
        updateProdukty.setIlosc(quant);
        return produktyRepository.save(updateProdukty);
    }

}
