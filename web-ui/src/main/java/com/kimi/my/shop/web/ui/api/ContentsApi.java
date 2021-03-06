package com.kimi.my.shop.web.ui.api;

import com.kimi.my.shop.commons.utils.HttpClientUtils;
import com.kimi.my.shop.commons.utils.MapperUtils;
import com.kimi.my.shop.web.ui.dto.TbContent;

import java.util.List;

/**
 * @author Arlin
 */
public class ContentsApi {
    public static List<TbContent> ppt(){
        List<TbContent> tbContents = null;
        String result = HttpClientUtils.doGet(API.API_CONTENTS_PPT);
        try {
            tbContents = MapperUtils.json2listByTree(result, "data", TbContent.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tbContents;
    }
}
