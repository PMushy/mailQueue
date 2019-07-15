package com.pl.mailQueue.service;

import com.pl.mailQueue.domain.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserServiceInterface extends UserDetailsService {
    User findUserByEmail(String email);

    void saveUser(User user);

    List<User> findAll();

    void updateUserPassword(String newPassword, String email);

    void deleteById(Long id);
}
