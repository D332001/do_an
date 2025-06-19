package com.portal.controller.users;

import com.portal.entities.*;
import com.portal.repositories.OrderRepo;
import com.portal.repositories.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@Controller
public class CartController {

    @Autowired ProductRepo productRepo;
    @Autowired OrderRepo orderRepo;

    @RequestMapping(value = { "/finish" }, method = RequestMethod.POST)
    public String finish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {

        HttpSession httpSession = request.getSession();
        Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");;
        List<CartItem> cartItems = cart.getCartItems();

        String customerAddress = request.getParameter("customerAddress");
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        Order order = new Order();
        order.setCode("ORDER-"+System.currentTimeMillis());
        order.setSeo("ORDER-"+System.currentTimeMillis());
        order.setCustomerName(customerName);
        order.setCustomerAddress(customerAddress);
        order.setCustomerPhone(customerPhone);
        order.setCustomerEmail(customerEmail);
        order.setTotal(new BigDecimal(strTotal));

        for(CartItem item : cartItems) {
            OrderProducts orderProducts = new OrderProducts();
            orderProducts.setProduct(productRepo.getOne(item.getProductId()));
            orderProducts.setCode(item.getCode());
            orderProducts.setName(item.getProductName());
            orderProducts.setQuality(item.getQuantity());
            orderProducts.setSize(item.getSize());
            orderProducts.setStyle(item.getStyle());
            orderProducts.setYear(item.getYear());
            order.addOrderProducts(orderProducts);
        }
        orderRepo.save(order);
        httpSession.setAttribute("SL_SP_GIO_HANG", 0);
        httpSession.setAttribute("GIO_HANG", null);

        return "users/finish";
    }
    String strPrice, strTotal, strNameSale;
    @RequestMapping(value = { "/check-price" }, method = RequestMethod.GET)
    public String checkOut(@RequestParam String priceSale, @RequestParam String total, @RequestParam String nameSale){
        strPrice = priceSale;
        strTotal =total;
        strNameSale = nameSale;
        return strPrice;
    }

    @RequestMapping(value = { "/check-out" }, method = RequestMethod.GET)
    public String check(Model model){
        model.addAttribute("priceSale", strPrice);
        model.addAttribute("nameSale", strNameSale);
        model.addAttribute("lastPrice", strTotal);
        return "users/checkout";
    }

    @RequestMapping(value = { "/order-item" }, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> orderItem(@RequestBody Cart data, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        HttpSession httpSession = request.getSession();
        Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
        List<CartItem> cartItems = cart.getCartItems();
        List<CartItem> listItem = data.getCartItems();
        for (CartItem item : cartItems) {
            for(CartItem item2: listItem){
                if (item.getProductId() == item2.getProductId()) {
                    item.setQuantity(item2.getQuantity());
                }
            }
        }
        return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(cart.getCartItems().size())));
    }
    Cart cart = null;
    @RequestMapping(value = {"/add-to-cart"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> muaHang(@RequestBody CartItem data, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("GIO_HANG") != null) {
            cart = (Cart) httpSession.getAttribute("GIO_HANG");
        } else {
            cart = new Cart();
            httpSession.setAttribute("GIO_HANG", cart);
        }

        List<CartItem> cartItems = cart.getCartItems();
        boolean isExists = false;
        for (CartItem item : cartItems) {
            if (item.getProductId() == data.getProductId()) {
                isExists = true;
                item.setQuantity(item.getQuantity()+ data.getQuantity());
                item.setSize(data.getSize());
                item.setStyle(data.getStyle());
                item.setYear(data.getYear());
            }
        }

        if (!isExists) {
            Product product = productRepo.getOne(data.getProductId());
            data.setProductName(product.getTitle());
            data.setUnitPrice(product.getPrice());
            data.setProductImage(product.getProductImages().get(0).getPath());
            cart.getCartItems().add(data);
        }

        long sum=0;
        for (int i=0; i<cartItems.size(); i++){
            sum += cartItems.get(i).getUnitPrice().longValue()*cartItems.get(i).getQuantity();
            httpSession.setAttribute("totalOrder", sum);
        }
        httpSession.setAttribute("SL_GIO_HANG", cart.getCartItems().size());

        return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(cart.getCartItems().size())));
    }
    @RequestMapping(value = { "/cart" })
    public String cart() {

        return "users/cart";
    }
    @GetMapping(value = "/remove-item")
    public String removeItem(@RequestParam int productId) {
        List<CartItem> cartItems = cart.getCartItems();
        if (cartItems.size() > 0){
            for (CartItem item : cartItems) {
                if (item.getProductId() == productId) {
                    cartItems.remove(item);
                        break;
                }
            }
        }
        return "users/cart";
    }
}


