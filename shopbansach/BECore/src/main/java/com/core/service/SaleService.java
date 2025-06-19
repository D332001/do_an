package com.core.service;

import com.core.entities.Sale;
import java.util.List;
public interface SaleService {
    List<Sale> findAllSale();
    Sale saveSale(Sale sale);
    void deleteSale(int id);
    Sale findPriceByCode(String nameSale);
    Sale findBySaleID(int id);
}
