package life.littleliu.community.mapper;

import life.littleliu.community.model.Comment;

public interface CommentExtMapper {
    int incCommentCount(Comment comment);
}