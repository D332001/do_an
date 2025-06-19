package com.core.service;

import com.core.entities.Role;
import com.core.entities.User;
import com.core.repositories.RoleRepo;
import com.core.repositories.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserRepo userRepo;
    @Autowired
    RoleRepo roleRepo;

    @Override
    public List<User> findUsers() {

        return userRepo.findAll();
    }

    @Override
    public User saveUser(User user) {
        return userRepo.save(user);
    }

    @Override
    public User adminSaveUser(User user) {
        User objUser = userRepo.findById(user.getId()).orElse(null);
        List<Role> listRoles = roleRepo.findByNameIn(user.getListName());
        objUser.setRoles(listRoles);
        return userRepo.save(objUser);
    }

    @Override
    public void deleteUser(int id) {
        userRepo.deleteById(id);
    }

    @Override
    public User update(Integer id, User user) {
        User u = userRepo.findById(id).orElse(null);
        u.setEmail(user.getEmail());
        u.setPhone(user.getPhone());
        u.setAddress(u.getAddress());
        u.setRoles(user.getRoles());
        return userRepo.save(u);
    }

    @Override
    public User findById(int id) {
        return userRepo.findById(id).orElse(null);
    }


}
