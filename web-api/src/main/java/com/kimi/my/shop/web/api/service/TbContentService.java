package com.kimi.my.shop.web.api.service;

import com.kimi.my.shop.domain.TbContent;
import org.springframework.stereotype.Service;

import java.util.List;
public interface TbContentService {
    List<TbContent> selectByCategoryId(Long categoryId);
}
