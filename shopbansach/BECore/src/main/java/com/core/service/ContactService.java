package com.core.service;

import com.core.entities.Contact;

import java.util.List;

public interface ContactService {
    Contact saveContact(Contact contact);
    List<Contact> findAllContact();
    void deleteContact(int id);

}
