package com.example.sklep_moto.Service;

import com.example.sklep_moto.Kategorie;
import com.example.sklep_moto.Repository.KategorieRepository;
import com.example.sklep_moto.Repository.UserRepository;
import com.example.sklep_moto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public List<User> findById(int id) { return userRepository.findUserByID(id); }


    public User saveUser(User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String password = user.getPassword();
        String hashedpassword = passwordEncoder.encode(password);
        user.setPassword(hashedpassword);

        return userRepository.save(user);
    }

    //public User updateUser(int id, User user) {
     //   User updateUser = userRepository.findById(id).orElse(null);
    //    updateUser.setNazwa_kategorii(kategorie.getNazwa_kategorii());
    //    return userRepository.save(updateKategorie);
   // }
}
