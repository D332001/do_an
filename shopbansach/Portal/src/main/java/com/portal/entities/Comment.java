package com.portal.entities;

import javax.persistence.*;

@Entity
@Table(name = "tbl_comment")
public class Comment extends BaseEntity{

    @Column(name = "comment", nullable = false)
    private String comment;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Product productComment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User userComment;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Product getProductComment() {
        return productComment;
    }

    public void setProductComment(Product productComment) {
        this.productComment = productComment;
    }

    public User getUserComment() {
        return userComment;
    }

    public void setUserComment(User userComment) {
        this.userComment = userComment;
    }
}
