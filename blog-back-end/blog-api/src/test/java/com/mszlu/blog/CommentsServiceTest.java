package com.mszlu.blog;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.mszlu.blog.dao.pojo.SysUser;
import com.mszlu.blog.service.CommentsService;
import com.mszlu.blog.utils.UserThreadLocal;
import com.mszlu.blog.vo.Result;
import com.mszlu.blog.vo.params.CommentParam;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
@Rollback
public class CommentsServiceTest {

    @Autowired
    private CommentsService commentsService;

    @Test
    public void testCommentsByArticleId() {
        // Arrange
        long articleId = 2;
        // Act
        Result result = commentsService.commentsByArticleId(articleId);

        // Assert
        assertEquals(result.isSuccess(), true);
        // Additional asserts to check the contents of the result
    }
    @Test
    public void testComment() {
        // Arrange
        CommentParam commentParam = new CommentParam();
        commentParam.setArticleId(1L);
        commentParam.setContent("goodtest");
//        commentParam.setParent(1L);
//        commentParam.setToUserId(1L);
        SysUser sysUser = new SysUser();
        sysUser.setId(1L);
        UserThreadLocal.put(sysUser);

        // Set the properties of commentParam

        // Act
        Result result = commentsService.comment(commentParam);

        // Assert
        assertEquals(result.isSuccess(), true);

    }
}
