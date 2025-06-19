package com.portal.controller.admin;

import com.portal.entities.ChatMessage;
import com.portal.entities.ListMess;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class ChatController {
    ChatMessage chatMessage1;
    ListMess listMess =null;

    @RequestMapping(value = "/admin/live-chat")
    public String liveChat(final HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("LIST_MESS") != null) {
            listMess = (ListMess) httpSession.getAttribute("LIST_MESS");
        } else {
            listMess = new ListMess();
            httpSession.setAttribute("LIST_MESS", listMess);
        }
        List<ChatMessage> chatMessages = listMess.getChatMessages();
        //List<ChatMessage> chatMessages = new ArrayList<ChatMessage>();
        chatMessages.add(chatMessage1);
        return "admin/live-chat";
    }

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(ChatMessage chatMessage){
       chatMessage1 = chatMessage;
        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage,
                               SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }

    @PostMapping(value = "/select-mess")
    public @ResponseBody ChatMessage selectMess(@RequestParam String sender, Model model){
        List<ChatMessage> chatMessages = listMess.getChatMessages();
        for (ChatMessage mess: chatMessages){
            if(mess.getSender().equals(sender) == true){
             return mess;
            }
        }
        return null;

    }

}
