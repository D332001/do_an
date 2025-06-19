package com.portal.controller.admin;
import com.portal.entities.Order;
import com.portal.entities.OrderProducts;
import com.portal.repositories.OrderProductRepo;
import com.portal.service.Email;
import com.portal.repositories.OrderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.util.List;

@Controller
public class EmailController {
    @Autowired
    private Email emailService;
    @Autowired
    OrderRepo orderRepo;

    @Autowired
    OrderProductRepo orderProductRepo;

    @PostMapping(value = "/admin/send-mail")
    public void sendmail(String id,String customerName, String customerEmail, String statusOrder, String total) throws MessagingException {
        List<OrderProducts> orderProducts = orderProductRepo.findAllByOrderId(Integer.valueOf(id));
        StringBuilder products = new StringBuilder();
        if(orderProducts.size() >0){
            products.append("<table style=\"width:100%;text-align: center;border:1px solid black;\"><tr><th>Mã sản phẩm</th><th>Tên sản phẩm</th><th>Số lượng</th><th>Size</th><th>Phong cách</th><th></th><Năm sản xuất/tr>");
            for(OrderProducts item : orderProducts){
                products.append("<tr><td>"+item.getCode()+"</td><td>"+item.getName()+"</td><td>"+item.getQuality()+"</td><td>"+item.getSize()+"</td><td>"+item.getStyle()+"</td><td>"+item.getYear()+"</td></tr>");
            }
            products.append("</table>").append("<br><p style=\"font-size:2rem;text-align: right;\">Tổng tiền phải thanh toán: "+total+"</p>");
            products.append("<br><img style=\"display:block; with: 400px; height: 400px;\n" +
                    "    margin:0 auto;\" src=\"https://www.english-learning.net/wp-content/uploads/2020/04/thank_you_2.jpg\">");
        }

        String content = "<b>Xin chào "+customerName+" !</b>,<br><i>Thông tin đơn hàng của bạn:</i>"
                + "<br><p></p>"+ products;
        if(statusOrder.equals("Da giao")==true){
            emailService.sendMail(customerEmail, "Shop VH", content);
        }
        else{
            emailService.sendMail(customerEmail, "Shop VH",
                    "Đơn hàng của bạn: "+statusOrder+"<br><img style=\"display:block; with: 400px; height: 400px;\n" +
                            "    margin:0 auto;\" src=\"https://www.english-learning.net/wp-content/uploads/2020/04/thank_you_2.jpg\">");
        }
        List<Order> orders = orderRepo.findAll();
        for(Order item: orders){
            if(item.getId().toString().equals(id)==true ){
                item.setStatusOrder(statusOrder);
                orderRepo.save(item);
            }
        }
    }
}
