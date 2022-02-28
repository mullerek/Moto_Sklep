package com.example.sklep_moto;

import com.example.sklep_moto.Produkty;
import com.example.sklep_moto.Zamowienia;

import javax.persistence.*;

@Entity
@Table(name = "zamowienia_produkty")
public class Zamowienia_Produkty {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_zamowienia_produkty;

    @ManyToOne
    @JoinColumn(name = "id_produktu")
    private Produkty produkty;

    @ManyToOne
    @JoinColumn(name = "id_zamowienia")
    private Zamowienia zamowienia;

    private int ilosc;

    public Integer getId_zamowienia_produkty() {
        return id_zamowienia_produkty;
    }

    public void setId_zamowienia_produkty(Integer id_zamowienia_produkty) {
        this.id_zamowienia_produkty = id_zamowienia_produkty;
    }

    public Produkty getProdukty() {
        return produkty;
    }

    public void setProdukty(Produkty produkty) {
        this.produkty = produkty;
    }

    public Zamowienia getZamowienia() {
        return zamowienia;
    }

    public void setZamowienia(Zamowienia zamowienia) {
        this.zamowienia = zamowienia;
    }

    public int getIlosc() {
        return ilosc;
    }

    public void setIlosc(int ilosc) {
        this.ilosc = ilosc;
    }
}
