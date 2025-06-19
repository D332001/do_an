package com.core.controller.admin;

import com.core.entities.Role;
import com.core.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/admin")
public class AdminRoleController {
    @Autowired RoleService roleService;

    @GetMapping("/list-role")
    public List<Role> getRole(){
        return roleService.findAllRole();
    }

    @PostMapping("/save-role")
    public Role addRole(@RequestBody Role role){
        return roleService.saveRole(role);
    }
    @DeleteMapping("/delete-role/{id}")
    public void deleteRole(@PathVariable int id){
        roleService.deleteRole(id);
    }

    @GetMapping("/edit-role/{id}")
    public Optional<Role> findRoleById(@PathVariable int id){
        return roleService.findRoleById(id);
    }

}
