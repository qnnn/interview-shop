package com.kimi.my.shop.domain;

import com.kimi.my.shop.commons.persistence.BaseEntity;
import lombok.Data;

/**
 * @author 郭富城
 */
@Data
public class ReceivingInfo {
    /**
     * ID
     */
    private Long id;

    /**
     * 客户信息
     */
    private TbUser tbUser;

    /**
     * 地址
     */
    private String location;

    /**
     * 详细地址
     */
    private String address;

    /**
     * 用户留言
     */
    private String userMessage;
}
