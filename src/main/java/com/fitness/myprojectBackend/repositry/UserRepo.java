package com.fitness.myprojectBackend.repositry;

import com.fitness.myprojectBackend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
    User findByUsername(String username);
    User findByUsernameOrEmailOrPhone(String username, String email, String phone);

    User findByUsernameOrEmail(String username, String email);
}
