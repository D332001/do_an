package com.core.controller.admin;

import com.core.entities.Sale;
import com.core.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AdminSaleController {
    @Autowired
    private SaleService saleService;

    @GetMapping(value = "/sales")
    public List<Sale> findAllSale(){
        List<Sale> sales = saleService.findAllSale();
            return sales;
    }

    @PostMapping(value = "/update-quantity")
    public void updateQuantity(String nameSale){
        List<Sale> sales = saleService.findAllSale();
        for(Sale item: sales){
            if(item.getNameSale().equals(nameSale)==true && item.getQuantity()>0){
                item.setQuantity(item.getQuantity()-1);
                saleService.saveSale(item);
            }
        }
    }

    @PostMapping(value = "/save-sale")
    public Sale saveSale(@RequestBody Sale sale){
        return saleService.saveSale(sale);
    }

    @DeleteMapping(value = "/delete-sale")
    public void deleteSale(@RequestParam int id){
        saleService.deleteSale(id);
    }

    @GetMapping(value = "/code-sale")
    public Sale findPriceByCode(@RequestParam String nameSale){
        return saleService.findPriceByCode(nameSale);
    }

    @RequestMapping(value = "/admin/edit-sale/{id}")
    public Sale editSale(@PathVariable int id){
        return saleService.findBySaleID(id);
    }
}
