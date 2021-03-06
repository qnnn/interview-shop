package com.kimi.my.shop.web.api.web.controller.v1;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.utils.CreateOrderNoUtils;
import com.kimi.my.shop.commons.utils.HttpClientUtils;
import com.kimi.my.shop.domain.AlipayBean;
import com.kimi.my.shop.domain.Order;
import com.kimi.my.shop.domain.ReceivingInfo;
import com.kimi.my.shop.domain.TbUser;
import com.kimi.my.shop.commons.constant.alipay;
import com.kimi.my.shop.web.api.service.OrderService;
import com.kimi.my.shop.web.api.web.dto.OrderDTO;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName OrderController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/9 17:21
 * @Version 1.0
 **/
@RestController
@RequestMapping(value = "${api.path.v1}/order")
public class OrderController {
    @Autowired
    OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping(value = "showOrder", method = RequestMethod.POST)
    public BaseResult showOrder(String userId, String status){
        if(StringUtils.isBlank(userId)){
            return BaseResult.fail("失败");
        }
        if(StringUtils.isBlank(status)){
            status = "1";
        }
        List<OrderDTO> orderDTOS = null;
        List<Order> orderList = orderService.showOrderList(Long.valueOf(userId), Integer.valueOf(status));
        if(orderList != null && orderList.size()>0){
            orderDTOS = new ArrayList<>();
            for(Order order : orderList){
                OrderDTO dto = new OrderDTO();
                dto.setId(order.getId());
                dto.setOrderNo(order.getOrderNo());
                dto.setProductId(order.getProduct().getId());
                dto.setProductName(order.getProduct().getName());
                dto.setImgUrl(order.getProduct().getImg1());
                dto.setPrice(order.getProduct().getPrice());
                dto.setTotalPrice(order.getTotalPrice());
                dto.setNumber(order.getNumber());
                dto.setReceivingInfoId(order.getReceivingInfo().getId());
                dto.setTrackingNo(order.getTrackingNo());
                dto.setStatus(order.getStatus());
                SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
                String created = format.format(order.getCreated().getTime());
                String updated = format.format(order.getUpdated().getTime());
                dto.setCreated(created);
                dto.setUpdated(updated);
                orderDTOS.add(dto);
            }
        }
        System.out.println("orderDTOS:"+orderDTOS);
        return BaseResult.success("成功", orderDTOS);
    }

    @RequestMapping(value = "submitOrder", method = RequestMethod.POST)
    public BaseResult submitOrder(String userId){
        if(StringUtils.isBlank(userId)){
            return BaseResult.fail("失败");
        }
        String orderNo = CreateOrderNoUtils.getOrderNo();
        orderService.submitOrder(Long.valueOf(userId), orderNo);
        return BaseResult.success("成功");
    }

    @RequestMapping(value = "deleteOrder", method = RequestMethod.POST)
    public BaseResult deleteOrder(String userId, String orderNo){
        if(StringUtils.isNotBlank(userId) && StringUtils.isNotBlank(orderNo)){
            if(orderService.deleteOrder(Long.valueOf(userId), orderNo) > 0){
                return BaseResult.success("成功");
            }
        }
        return BaseResult.fail("失败");
    }

    @RequestMapping(value = "confirmReceipt", method = RequestMethod.POST)
    public BaseResult confirmReceipt(String orderNo){
        if(StringUtils.isNotBlank(orderNo)){
            if(orderService.confirmReceipt(orderNo) > 0){
                return BaseResult.success("成功");
            }
        }
        return BaseResult.fail("失败");
    }

    @RequestMapping(value = "paySuccess", method = RequestMethod.POST)
    public BaseResult paySuccess(String orderNo){
        if(StringUtils.isNotBlank(orderNo)){
            if(orderService.paySuccess(orderNo) > 0){
                return BaseResult.success("成功");
            }
        }
        return BaseResult.fail("失败");
    }

    @RequestMapping(value = "payOrder", method = RequestMethod.POST)
    public BaseResult payOrder(String orderNo, String id,
                               String userId, String userName,
                               String userPhone, String userLocation,
                               String userAddress, String userMessage) throws Exception {
        if(StringUtils.isBlank(orderNo) || StringUtils.isBlank(id) ||
                StringUtils.isBlank(userId) || StringUtils.isBlank(userName) ||
                StringUtils.isBlank(userPhone) || StringUtils.isBlank(userLocation) ||
                StringUtils.isBlank(userAddress) || StringUtils.isBlank(userMessage)){
            return BaseResult.fail("失败");
        }
        ReceivingInfo receivingInfo = new ReceivingInfo();
        TbUser tbUser = new TbUser();
        tbUser.setId(Long.valueOf(userId));
        tbUser.setUsername(userName);
        tbUser.setPhone(userPhone);
        receivingInfo.setId(Long.valueOf(id));
        receivingInfo.setTbUser(tbUser);
        receivingInfo.setLocation(userLocation);
        receivingInfo.setAddress(userAddress);
        receivingInfo.setUserMessage(userMessage);
        orderService.payOrder(receivingInfo, orderNo);
        //调用支付宝，返回支付结果页面内容
        String result = orderPay(userId, orderNo);
        return BaseResult.success(result);
    }

    /**
     * 下单
     * @param orderNo 订单号
     * @return 返回支付结果页面内容
     * @throws AlipayApiException
     */
    public String orderPay(String userId, String orderNo) throws AlipayApiException {
        BigDecimal orderAmount = new BigDecimal(0);
        List<Order> orderList = orderService.showOrderListByOrderNo(Long.valueOf(userId), orderNo, 1);
        for(Order order : orderList){
            orderAmount = orderAmount.add(order.getTotalPrice());
        }
        System.out.println("orderNo:"+orderNo);
        System.out.println("orderAmount:"+orderAmount);
        //调用支付宝
        AlipayBean alipayBean = new AlipayBean();
        alipayBean.setOut_trade_no(orderNo);
        alipayBean.setSubject("支付订单:" + orderNo);
        alipayBean.setTotal_amount(orderAmount.toString());
        String pay = pay(alipayBean);
        System.out.println("pay:" + pay);
        return pay;
    }

    /**
     * 支付接口
     * @param alipayBean 封装的支付宝入参
     * @return 返回支付结果
     * @throws AlipayApiException 抛出异常
     */
    public String pay(AlipayBean alipayBean) throws AlipayApiException {
        // 1、获得初始化的AlipayClient
        String serverUrl = alipay.gatewayUrl;
        String appId = alipay.appId;
        String privateKey = alipay.privateKey;
        String format = "json";
        String charset = alipay.charset;
        String alipayPublicKey = alipay.publicKey;
        String signType = alipay.signType;
        String returnUrl = alipay.returnUrl;
        String notifyUrl = alipay.notifyUrl;
        AlipayClient alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, alipayPublicKey, signType);
        // 2、设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        // 页面跳转同步通知页面路径
        alipayRequest.setReturnUrl(returnUrl);
        // 服务器异步通知页面路径
        alipayRequest.setNotifyUrl(notifyUrl);
        // 封装参数
        alipayRequest.setBizContent(JSON.toJSONString(alipayBean));
        // 3、请求支付宝进行付款，并获取支付结果
        return alipayClient.pageExecute(alipayRequest).getBody();
    }

}
