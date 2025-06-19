package com.core.service;


import com.core.entities.Contact;
import com.core.repositories.ContactRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService{
    @Autowired
    private ContactRepo contactRepo;

    @Override
    public Contact saveContact(Contact contact) {
        return contactRepo.save(contact);
    }

    @Override
    public List<Contact> findAllContact() {
        return contactRepo.findAll();
    }

    @Override
    public void deleteContact(int id) {
        contactRepo.deleteById(id);
    }


}
