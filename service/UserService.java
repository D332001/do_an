package com.core.service;

import com.core.entities.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    List<User> findUsers();
    User saveUser(User user);
    User adminSaveUser(User user);
    void deleteUser(int id);
    User update(Integer id, User user);
    User findById(int id);
}
