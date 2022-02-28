package com.example.sklep_moto.Service;

import com.example.sklep_moto.Repository.ZamowieniaRepository;
import com.example.sklep_moto.Zamowienia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZamowieniaService {

    @Autowired
    ZamowieniaRepository zamowieniaRepository;

    public List<Zamowienia> findAllOrders () {return zamowieniaRepository.findAll();}
}
