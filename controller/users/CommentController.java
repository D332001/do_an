package com.core.controller.users;

import com.core.entities.Comment;
import com.core.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CommentController {
    @Autowired
    CommentService commentService;

    @PostMapping(value = "/save-comment")
    public Comment saveComment(@RequestBody Comment comment){
        return  commentService.saveComment(comment);
    }

    @GetMapping(value = "/comment-product/{seo}")
    public List<Comment> findAllComment(@PathVariable String seo){
        return  commentService.findAllCommentByProductId(seo);
    }
}
