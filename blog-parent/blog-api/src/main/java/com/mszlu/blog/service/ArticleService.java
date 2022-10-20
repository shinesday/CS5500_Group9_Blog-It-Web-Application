package com.mszlu.blog.service;

import com.mszlu.blog.vo.Result;
import com.mszlu.blog.vo.param.PageParams;

public interface ArticleService {
    /**
     * Paging query  Article list
     * @param pageParams
     * @return
     */
    Result listArticle(PageParams pageParams);
}
