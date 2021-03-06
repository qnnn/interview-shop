package com.kimi.my.shop.web.api.web.controller.v1;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.domain.TbContent;
import com.kimi.my.shop.web.api.service.TbContentService;
import com.kimi.my.shop.web.api.web.dto.TbContentDTO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "${api.path.v1}/contents")
public class TbContentController {

    @Autowired
    private TbContentService tbContentService;

    @ModelAttribute
    public TbContent getTbContent(Long id){
        TbContent tbContent;

        if(id==null){
            tbContent=new TbContent();
        }
        else {
            tbContent=null;
        }

        return tbContent;
    }

    /**
     *功能描述：<br>
     *(幻灯片接口)
     *@Param:[categoryId]
     *@Return:com.kimi.my.shop.commons.dto.BaseResult
     *@Author:郭富城
     *@Date:2020/9/1420:18
    */
    @RequestMapping(value = "ppt",method = RequestMethod.GET)
    public BaseResult findPPT(){
        List<TbContentDTO> tbContentDTOS = null;
        List<TbContent> tbContents = tbContentService.selectByCategoryId(89L);

        if (tbContents != null && tbContents.size()>0){
            tbContentDTOS = new ArrayList<>();
            for (TbContent tbContent : tbContents){
                TbContentDTO dto = new TbContentDTO();
                //反射类
                BeanUtils.copyProperties(tbContent,dto);
                tbContentDTOS.add(dto);
            }
        }

        return BaseResult.success("成功",tbContentDTOS);
    }

}
