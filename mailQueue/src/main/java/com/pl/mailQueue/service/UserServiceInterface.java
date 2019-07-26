package com.pl.mailQueue.service;

import com.pl.mailQueue.domain.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Optional;

public interface UserServiceInterface extends UserDetailsService {
    User findUserByEmail(String email);

    void saveUser(User user);

    List<User> findAll();

    void updateUserPassword(String newPassword, String email);

    void deleteById(Long id);

    Optional<User> findUserById(Long id);
}
