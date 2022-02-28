package com.example.sklep_moto;


import javax.persistence.*;

@Entity
@Table(name = "produkty")
public class Produkty {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_produktu;

    @Column
    private Integer id_kategoria;

    @Column
    private String nazwa_produktu;

    @Column
    private String producent;

    @Column
    private String opis;

    @Column
    private String rozmiar;

    @Column
    private Integer ilosc;

    @Column
    private Double cena;

    @Column
    private String zdjecie;

    public Integer getId_produktu() {
        return id_produktu;
    }

    public void setId_produktu(Integer id_produktu) {
        this.id_produktu = id_produktu;
    }

    public Integer getId_kategoria() {
        return id_kategoria;
    }

    public void setId_kategoria(Integer id_kategoria) {
        this.id_kategoria = id_kategoria;
    }

    public String getNazwa_produktu() {
        return nazwa_produktu;
    }

    public void setNazwa_produktu(String nazwa_produktu) {
        this.nazwa_produktu = nazwa_produktu;
    }

    public String getProducent() {
        return producent;
    }

    public void setProducent(String producent) {
        this.producent = producent;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getRozmiar() {
        return rozmiar;
    }

    public void setRozmiar(String rozmiar) {
        this.rozmiar = rozmiar;
    }

    public Integer getIlosc() {
        return ilosc;
    }

    public void setIlosc(Integer ilosc) {
        this.ilosc = ilosc;
    }

    public Double getCena() {
        return cena;
    }

    public void setCena(Double cena) {
        this.cena = cena;
    }

    public String getZdjecie() {
        return zdjecie;
    }

    public void setZdjecie(String zdjecie) {
        this.zdjecie = zdjecie;
    }
}
