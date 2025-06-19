package com.core.service;

import com.core.entities.Comment;
import com.core.repositories.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired CommentRepo commentRepo;

    @Override
    public Comment saveComment(Comment comment) {
        return commentRepo.save(comment);
    }

    @Override
    public List<Comment> findAllCommentByProductId(String seo) {
        return commentRepo.findAllByProductCommentSeo(seo);
    }
}
