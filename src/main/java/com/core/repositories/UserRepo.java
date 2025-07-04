package com.core.repositories;

import com.core.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.*;
@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
    List<User> findAllByIdNot(Integer id);
}
