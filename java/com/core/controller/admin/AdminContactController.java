package com.core.controller.admin;

import com.core.entities.Contact;
import com.core.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
public class AdminContactController {
    @Autowired
    private ContactService contactService;

//    port 8081
    @RequestMapping(value = "/contact-list")
    public List<Contact> findAllContact(){
        List<Contact> list = contactService.findAllContact();
        return list;
    }

    @RequestMapping(value = "/save-contact", method = RequestMethod.POST)
    public Contact saveContact(@RequestBody Contact contact){

        return contactService.saveContact(contact);
    }

    @DeleteMapping(value = "/delete")
    public void deleteContact(@RequestParam ("id") int id){
        contactService.deleteContact(id);
    }
}
