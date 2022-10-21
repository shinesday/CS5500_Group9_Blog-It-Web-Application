package com.mszlu.blog.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mszlu.blog.dao.pojo.Tag;

import java.util.List;

public interface TagMapper extends BaseMapper<Tag> {
    /**
     * Query list of tags based on article id
     * @param articleId
     * @return
     */
    List<Tag> findTagsByArticleId(Long articleId);

    /**
     * Query the hottest tags, select top-n
     * @param limit
     * @return
     */
    List<Long> finHotsTagIds(int limit);

    List<Tag> findTagsByTagIds(List<Long> tagIds);
}
