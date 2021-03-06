package com.kimi.my.shop.web.ui.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName ReceivingInfo
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 22:28
 * @Version 1.0
 **/
@Data
public class ReceivingInfo implements Serializable {

    private String id;
    private String userId;
    private String userName;
    private String userPhone;
    private String userLocation;
    private String userAddress;
    private String userMessage;
    private String orderNo;
}
