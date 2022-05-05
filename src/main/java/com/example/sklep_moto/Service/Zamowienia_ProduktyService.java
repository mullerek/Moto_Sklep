package com.example.sklep_moto.Service;

import com.example.sklep_moto.Repository.ZamowieniaProduktyRepository;
import com.example.sklep_moto.User;
import com.example.sklep_moto.Zamowienia_Produkty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Zamowienia_ProduktyService {

    @Autowired
    ZamowieniaProduktyRepository zamowieniaProduktyRepository;

    public List<Zamowienia_Produkty> listOrderedProducts(User user) {
        return zamowieniaProduktyRepository.findByUser(user.getId_user());
    }

    public List<Zamowienia_Produkty> listKlientOrderedProducts(Integer uid, Integer zid) {
        return zamowieniaProduktyRepository.findByUserAndZid(uid,zid);
    }

}
