package com.kimi.my.shop.web.api.web.dto;

import lombok.Data;

/**
 * @ClassName ReceivingInfoDTO
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 22:32
 * @Version 1.0
 **/
@Data
public class ReceivingInfoDTO {

    private Long id;
    private Long userId;
    private String userName;
    private String userPhone;
    private String userLocation;
    private String userAddress;
    private String userMessage;
    private String orderNo;
}
