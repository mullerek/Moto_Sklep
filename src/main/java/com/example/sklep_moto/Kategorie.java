package com.example.sklep_moto;

import javax.persistence.*;

@Entity
@Table(name="kategorie")
public class Kategorie {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_kategorii;

    @Column
    private String nazwa_kategorii;

    public Integer getId_kategorii() {
        return id_kategorii;
    }

    public void setId_kategorii(Integer id_kategorii) {
        this.id_kategorii = id_kategorii;
    }

    public String getNazwa_kategorii() {
        return nazwa_kategorii;
    }

    public void setNazwa_kategorii(String nazwa_kategorii) {
        this.nazwa_kategorii = nazwa_kategorii;
    }
}
