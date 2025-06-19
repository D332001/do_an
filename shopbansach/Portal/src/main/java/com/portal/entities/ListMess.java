package com.portal.entities;

import java.util.ArrayList;
import java.util.List;

public class ListMess {
    List<ChatMessage> chatMessages = new ArrayList<ChatMessage>();

    public List<ChatMessage> getChatMessages() {
        return chatMessages;
    }

    public void setChatMessages(List<ChatMessage> chatMessages) {
        this.chatMessages = chatMessages;
    }
}
