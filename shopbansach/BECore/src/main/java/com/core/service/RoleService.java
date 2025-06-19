package com.core.service;

import com.core.entities.Role;

import java.util.List;
import java.util.Optional;

public interface RoleService {

    List<Role> findAllRole();

    Role saveRole(Role role);

    void deleteRole(int id);

    Optional<Role> findRoleById(int id);
}
