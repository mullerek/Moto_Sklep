package com.example.sklep_moto.Service;

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

    public List<User> findById(int id) { return userRepository.findUserByID(id); }

    public Optional<User> findUserById(int id) {return userRepository.findById(id); }


    public User updateUser(int id, User user) {
        User updateUser = userRepository.findById(id).orElse(null);
        updateUser.setImie(user.getImie());
        updateUser.setNazwisko(user.getNazwisko());
        updateUser.setUlica(user.getUlica());
        updateUser.setKod_pocztowy(user.getKod_pocztowy());
        updateUser.setMiasto(user.getMiasto());
        updateUser.setNr_tel(user.getNr_tel());
        updateUser.setEmail(user.getEmail());
        return userRepository.save(updateUser);
    }


    public User saveUser(User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedpassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedpassword);

        return userRepository.save(user);
    }


}
