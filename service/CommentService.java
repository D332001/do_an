package com.core.service;


import com.core.entities.Comment;
import java.util.List;

public interface CommentService {
    Comment saveComment(Comment comment);
    List<Comment> findAllCommentByProductId(String seo);


}
