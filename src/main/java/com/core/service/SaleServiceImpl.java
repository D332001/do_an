package com.core.service;

import com.core.entities.Sale;
import com.core.repositories.SaleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaleServiceImpl implements SaleService{
    @Autowired
    private SaleRepo saleRepo;

    @Override
    public List<Sale> findAllSale() {
        return saleRepo.findAll();
    }

    @Override
    public Sale saveSale(Sale sale) {
        return saleRepo.save(sale);
    }

    @Override
    public void deleteSale(int id) {
        saleRepo.deleteById(id);
    }

    @Override
    public Sale findPriceByCode(String nameSale) {
       return saleRepo.findPriceByCode(nameSale);
    }

    @Override
    public Sale findBySaleID(int id) {
        return saleRepo.findById(id).get();
    }


}
