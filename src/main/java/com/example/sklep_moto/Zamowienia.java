package com.example.sklep_moto;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name= "zamowienia")
public class Zamowienia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_zamowienia;

    @ManyToOne
    @JoinColumn(name = "id_klienta")
    private User user;

    private LocalDateTime data_zamowienia;

    private boolean czy_zrealizowano;

    private String rodzaj_platnosci;

    private double wartosc_zamowienia;

    private String rodzaj_dostawy;

    public Integer getId_zamowienia() {
        return id_zamowienia;
    }

    public void setId_zamowienia(Integer id_zamowienia) {
        this.id_zamowienia = id_zamowienia;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getData_zamowienia() {
        return data_zamowienia;
    }

    public void setData_zamowienia(LocalDateTime data_zamowienia) {
        this.data_zamowienia = data_zamowienia;
    }

    public boolean isCzy_zrealizowano() {
        return czy_zrealizowano;
    }

    public void setCzy_zrealizowano(boolean czy_zrealizowano) {
        this.czy_zrealizowano = czy_zrealizowano;
    }

    public String getRodzaj_platnosci() {
        return rodzaj_platnosci;
    }

    public void setRodzaj_platnosci(String rodzaj_platnosci) {
        this.rodzaj_platnosci = rodzaj_platnosci;
    }

    public double getWartosc_zamowienia() {
        return wartosc_zamowienia;
    }

    public void setWartosc_zamowienia(double wartosc_zamowienia) {
        this.wartosc_zamowienia = wartosc_zamowienia;
    }

    public String getRodzaj_dostawy() {
        return rodzaj_dostawy;
    }

    public void setRodzaj_dostawy(String rodzaj_dostawy) {
        this.rodzaj_dostawy = rodzaj_dostawy;
    }
}
