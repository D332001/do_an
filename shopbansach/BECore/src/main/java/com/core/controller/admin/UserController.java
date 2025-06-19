package com.core.controller.admin;

import com.core.entities.User;
import com.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping(value = "/admin/users")
    public List<User> findAllUser(){
        return userService.findUsers();
    }

    @PostMapping(value = "/save-user")
    public User saveUser(@RequestBody User user){
        return userService.saveUser(user);
    }
    @PutMapping(value = "/update-user/{id}")
    public User update(@PathVariable Integer id, @RequestBody User user){
        return userService.update(id, user);
    }

    @DeleteMapping(value = "/admin/delete-user/{id}")
    public void deleteUser(@PathVariable int id){
        userService.deleteUser(id);
    }

    @GetMapping("/admin/edit-user/{id}")
    public User editUser(@PathVariable int id){
        return userService.findById(id);
    }

    @PostMapping(value = "admin/save-user")
    public User adminSaveUser(@RequestBody User user){
        return userService.adminSaveUser(user);
    }
}
