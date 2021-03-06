package com.kimi.my.shop.web.ui.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kimi.my.shop.commons.utils.HttpClientUtils;
import com.kimi.my.shop.commons.utils.MapperUtils;
import com.kimi.my.shop.web.ui.dto.Order;
import com.kimi.my.shop.web.ui.dto.ReceivingInfo;
import org.apache.http.message.BasicNameValuePair;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName OrderApi
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 21:46
 * @Version 1.0
 **/
public class OrderApi {

    /**
     * 显示订单
     * @param userId
     * @param status
     * @return
     */
    public static List<Order> showOrder(String userId, String status){
        BasicNameValuePair param1 = new BasicNameValuePair("userId", userId);
        BasicNameValuePair param2 = new BasicNameValuePair("status", status);
        String result = HttpClientUtils.doPost(API.API_SHOW_ORDER, param1, param2);
        try {
            List<Order> orderList = MapperUtils.json2listByTree(result, "data", Order.class);
            return orderList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 提交订单
     * @param userId
     */
    public static void submitOrder(String userId){
        BasicNameValuePair param1 = new BasicNameValuePair("userId", userId);
        String result = HttpClientUtils.doPost(API.API_SUBMIT_ORDER, param1);
        System.out.println("submitOrder-result:"+result);
    }

    /**
     * 删除订单
     * @param userId
     * @param orderNo
     */
    public static void deleteOrder(String userId, String orderNo){
        BasicNameValuePair param1 = new BasicNameValuePair("userId", userId);
        BasicNameValuePair param2 = new BasicNameValuePair("orderNo", orderNo);
        String result = HttpClientUtils.doPost(API.API_DELETE_ORDER, param1, param2);
        System.out.println("deleteOrder-result:"+result);
    }

    /**
     * 支付订单
     * @param receivingInfo
     */
    public static String payOrder(ReceivingInfo receivingInfo){
        BasicNameValuePair param1 = new BasicNameValuePair("orderNo", receivingInfo.getOrderNo());
        BasicNameValuePair param2 = new BasicNameValuePair("id", receivingInfo.getId());
        BasicNameValuePair param3 = new BasicNameValuePair("userId", receivingInfo.getUserId());
        BasicNameValuePair param4 = new BasicNameValuePair("userName", receivingInfo.getUserName());
        BasicNameValuePair param5 = new BasicNameValuePair("userPhone", receivingInfo.getUserPhone());
        BasicNameValuePair param6 = new BasicNameValuePair("userLocation", receivingInfo.getUserLocation());
        BasicNameValuePair param7 = new BasicNameValuePair("userAddress", receivingInfo.getUserAddress());
        BasicNameValuePair param8 = new BasicNameValuePair("userMessage", receivingInfo.getUserMessage());
        String result = HttpClientUtils.doPost(API.API_PAY_ORDER, param1, param2, param3, param4, param5, param6, param7, param8);
        System.out.println("payOrder-result:"+result);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> map =  new HashMap<String, String>();
        try{
            map = mapper.readValue(result, new TypeReference<HashMap<String,String>>(){});
            System.out.println(map);
        }catch(Exception e){
            e.printStackTrace();
        }
        return map.get("message");
    }

    /**
     * 确认收货
     * @param orderNo
     */
    public static void confirmReceipt(String orderNo){
        BasicNameValuePair param1 = new BasicNameValuePair("orderNo", orderNo);
        String result = HttpClientUtils.doPost(API.API_CONFIRM_RECEIPT, param1);
        System.out.println("confirmReceipt-result:"+result);
    }

    /**
     * 异步回调，置支付成功
     * @param orderNo
     */
    public static void paySuccess(String orderNo){
        BasicNameValuePair param1 = new BasicNameValuePair("orderNo", orderNo);
        String result = HttpClientUtils.doPost(API.API_PAY_SUCCESS, param1);
        System.out.println("notifyPayResult-result:"+result);
    }
}