package life.littleliu.community.mapper;

import life.littleliu.community.model.Question;

public interface QuestionExtMapper {
    int incView(Question record);
    int incCommentCount(Question record);
}