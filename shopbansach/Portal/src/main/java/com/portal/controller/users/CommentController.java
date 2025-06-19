package com.portal.controller.users;


import com.portal.entities.Comment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class CommentController {
    RestTemplate restTemplate = new RestTemplate();

    @PostMapping(value = "/save-comment")
    public @ResponseBody
    Comment saveComment(@RequestBody Comment data){
        restTemplate.postForObject("http://localhost:8081/save-comment",data, Comment.class);
        return data;
    }
}
