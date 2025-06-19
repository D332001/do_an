package com.core.service;

import com.core.entities.Role;
import com.core.repositories.RoleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoleServiceImpl implements RoleService{
    @Autowired private RoleRepo roleRepo;

    @Override
    public List<Role> findAllRole() {
        return roleRepo.findAll();
    }

    @Override
    public Role saveRole(Role role) {
        return roleRepo.save(role);
    }

    @Override
    public void deleteRole(int id) {
        roleRepo.deleteById(id);
    }

    @Override
    public Optional<Role> findRoleById(int id) {
        return roleRepo.findById(id);
    }
}
