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
    // testing object
    @Autowired
    private CommentsController commentsController;
    @Autowired
    private MockMvc mvc;
    @Autowired
    private WebApplicationContext wac;
    // Prepare test objects before running tests
    @Before
    public void setup() {

        // Initialize test object...
        commentsController = new CommentsController();
        // Initialize the MockMvc object
        mvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    @Test
    public void testComments() throws Exception {
        RequestBuilder request = null;
        request = get("/comments/article/1");
//        request.setRequestURI("/comments/article/1");

        mvc.perform(request).andDo(print());

    }

    @After
    public void tearDown() {
        commentsController = null;
    }
}

