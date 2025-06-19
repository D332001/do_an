package com.portal.entities;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "tbl_sale")
public class Sale extends BaseEntity{
    @Column(name = "name", nullable = false)
    private String nameSale;

    @Column(name = "price", nullable = false)
    private BigDecimal priceSale;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Column(name = "time")
    private LocalDateTime timeSale;

    @Column(name = "quantity")
    private int quantity;

    public String getNameSale() {
        return nameSale;
    }

    public void setNameSale(String nameSale) {
        this.nameSale = nameSale;
    }

    public BigDecimal getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(BigDecimal priceSale) {
        this.priceSale = priceSale;
    }

    public LocalDateTime getTimeSale() {
        return timeSale;
    }

    public void setTimeSale(LocalDateTime timeSale) {
        this.timeSale = timeSale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
