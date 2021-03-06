package com.kimi.my.shop.domain;

import com.kimi.my.shop.commons.persistence.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 *功能描述：<br>
 *(内容管理)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/8/1421:20
*/
@EqualsAndHashCode(callSuper = true)
@Data
public class TbContent extends BaseEntity {

//    @NotNull(message = "父级类目不能为空")
//    private Long categoryId;
    private String title;
    private String subTitle;
    private String titleDesc;
    private String url;
    private String pic;
    private String pic2;
    private String content;

    private TbContentCategory tbContentCategory;

}
