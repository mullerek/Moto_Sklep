package com.example.sklep_moto.Service;

import com.example.sklep_moto.Kategorie;
import com.example.sklep_moto.Repository.KategorieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class KategorieService {

    @Autowired
    private KategorieRepository kategorieRepository;

    public List<Kategorie> findAll() {
        return kategorieRepository.findAll();
    }

    public Optional<Kategorie> findById(int id) { return kategorieRepository.findById(id); }

    public Kategorie saveKategorie(Kategorie kategorie) {
        return kategorieRepository.save(kategorie);
    }

    public Kategorie updateKategorie(int id, Kategorie kategorie) {
        Kategorie updateKategorie = kategorieRepository.findById(id).orElse(null);
        updateKategorie.setNazwa_kategorii(kategorie.getNazwa_kategorii());
        return kategorieRepository.save(updateKategorie);
    }

    public void deleteById(int id) {
        kategorieRepository.deleteById(id);
    }

}
