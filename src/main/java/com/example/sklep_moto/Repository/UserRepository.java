package com.example.sklep_moto.Repository;

import com.example.sklep_moto.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends JpaRepository<User,Integer> {

    User findUserByUsername(String username);

    @Query(value = "select * from moto_sklep.uzytkownicy where id_user=?1",nativeQuery = true)
    public List<User> findUserByID(int id);

}
