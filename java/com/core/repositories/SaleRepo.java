package com.core.repositories;

import com.core.entities.Sale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SaleRepo  extends JpaRepository<Sale, Integer> {
    @Query("select s from Sale s where s.nameSale = ?1")
    Sale findPriceByCode(String nameSale);
}
