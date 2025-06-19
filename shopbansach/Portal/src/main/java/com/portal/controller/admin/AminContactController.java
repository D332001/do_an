package com.portal.controller.admin;

import com.portal.entities.Contact;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class AminContactController {
    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/admin/contacts")
    public String adminContact(Model model){
        ResponseEntity<Contact[]> contacts = restTemplate.getForEntity("http://localhost:8081/contact-list", Contact[].class);
        model.addAttribute("contacts", contacts.getBody());
        return "admin/AdminContact";
    }

    @RequestMapping("/contact")
    public String addContact(Model model) {
        model.addAttribute("contact", new Contact());
         return "users/contact";
    }

    @RequestMapping(value = "/delete")
    public String deleteContact(@RequestParam int id){
        restTemplate.delete("http://localhost:8081/delete?id="+id);
        return "redirect:/admin/contacts";
    }

    @RequestMapping(value = "/save-contact", method = RequestMethod.POST)
    public ResponseEntity<Contact> saveContact(@RequestBody Contact data){
       restTemplate.postForObject("http://localhost:8081/save-contact",data, Contact.class);
        return new ResponseEntity<>(data, HttpStatus.CREATED);
    }

}





















//    @RequestMapping("/contact")
//    public String newMess(Model model) {
//        RestTemplate restTemplate = new RestTemplate();
//        String fooResourceUrl
//                = "http://localhost:8080/admin/getContact";
//        ResponseEntity<Contact> response
//                = restTemplate.getForEntity(fooResourceUrl + "/1", Contact.class);
//       model.addAttribute("contact", response.getBody());
//        return "users/contact";
//    }
