package com.mszlu.blog;


import com.mszlu.blog.controller.CommentsController;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runner.Runner;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

@SpringBootTest
@Transactional
@Rollback()
@AutoConfigureMockMvc
@WebAppConfiguration
@RunWith(SpringRunner.class)
public class CommentsControllerTest {
    // 测试对象
    @Autowired
    private CommentsController commentsController;
    @Autowired
    private MockMvc mvc;
    @Autowired
    private WebApplicationContext wac;
    // 在运行测试之前准备测试对象
    @Before
    public void setup() {

        // 初始化测试对象...
        commentsController = new CommentsController();
        //初始化MockMvc对象
        mvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    // 测试 comments() 方法
    @Test
    public void testComments() throws Exception {
        RequestBuilder request = null;
        request = get("/comments/article/1");
//        request.setRequestURI("/comments/article/1");

        mvc.perform(request).andDo(print());

    }

    // 在运行完测试后清理测试环境
    @After
    public void tearDown() {
        commentsController = null;
        // 清理其他测试资源...
    }
}

