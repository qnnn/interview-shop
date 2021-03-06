package com.kimi.my.shop.web.ui.controller;

import com.alipay.api.internal.util.AlipaySignature;
import com.kimi.my.shop.commons.constant.alipay;
import com.kimi.my.shop.web.ui.api.CartApi;
import com.kimi.my.shop.web.ui.api.OrderApi;
import com.kimi.my.shop.web.ui.constant.SystemConstants;
import com.kimi.my.shop.web.ui.dto.Order;
import com.kimi.my.shop.web.ui.dto.ReceivingInfo;
import com.kimi.my.shop.web.ui.dto.TbUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @ClassName OrderController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 21:19
 * @Version 1.0
 **/
@Controller("uiOrderController")
public class OrderController {

    @RequestMapping(value = "order", method = RequestMethod.GET)
    public String showOrder(String status, HttpServletRequest request){

        if(StringUtils.isBlank(status)){
            status = "1";
        }
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        List<Order> orderList = OrderApi.showOrder(String.valueOf(user.getId()), status);
        if(orderList != null){
            //orderList以订单号分类，
            Map<String, List<Order>> orderMap = orderList.stream().collect(Collectors.groupingBy(
                    Order::getOrderNo));
            List<List<Order>> orderLists = new ArrayList(orderMap.values());
            System.out.println("orderLists:"+orderLists);

            //计算每个订单的总数量和总价格
            for(int i = 0; i < orderLists.size(); i++){
                int allNumber = 0;
                BigDecimal allPrice = new BigDecimal(0);
                for(int j = 0; j < orderLists.get(i).size(); j++){
                    allNumber += orderLists.get(i).get(j).getNumber();
                    allPrice = allPrice.add(orderLists.get(i).get(j).getTotalPrice());
                }
                orderLists.get(i).get(0).setAllNumber(allNumber);
                orderLists.get(i).get(0).setAllPrice(allPrice);
            }
            request.setAttribute("orderLists", orderLists);
        }
        request.setAttribute("status", status);
        return "order";
    }

    /**
     * 提交订单
     * @param request
     * @return
     */
    @RequestMapping(value = "submitOrder",method = RequestMethod.GET)
    public String submitOrder(HttpServletRequest request){
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        OrderApi.submitOrder(String.valueOf(user.getId()));
        CartApi.updateCartNum(request);
        return "redirect:order";
    }

    /**
     * 删除订单
     * @param orderNo
     * @param request
     * @return
     */
    @RequestMapping(value = "deleteOrder", method = RequestMethod.GET)
    public String deleteOrder(String orderNo, HttpServletRequest request){
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        OrderApi.deleteOrder(String.valueOf(user.getId()), orderNo);
        return "redirect:order";
    }

    /**
     * 支付订单
     * @param receivingInfo
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "payOrder", method = RequestMethod.POST)
    public void payOrder(ReceivingInfo receivingInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        receivingInfo.setUserId(String.valueOf(user.getId()));
        System.out.println("receivingInfo:"+receivingInfo);
        String payResult = OrderApi.payOrder(receivingInfo);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(payResult);
        response.getWriter().flush();
        response.getWriter().close();
    }

    /**
     * 确认收货
     * @param orderNo
     * @return
     */
    @RequestMapping(value = "confirmReceipt", method = RequestMethod.GET)
    public String confirmReceipt(String orderNo){
        OrderApi.confirmReceipt(orderNo);
        return "redirect:order?status=4";
    }

    /**
     * 支付成功的跳转页面
     * @return
     */
    @RequestMapping(value = "goPaySuccessPage")
    public String goPaySuccessPage(){
        return "pay-success";
    }

    /**
     * 支付成功的回调接口
     * @return
     */
    @ResponseBody
    @RequestMapping("/notifyPayResult")
    public String notifyPayResult(HttpServletRequest request) {
        System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<进入支付宝回调->>>>>>>>>>>>>>>>>>>>>>>>>");
        // 1.从支付宝回调的request域中取值放到map中
        Map<String, String[]> requestParams = request.getParameterMap();

        Map<String, String> params = new HashMap();
        for (String name : requestParams.keySet()) {
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        //2.封装必须参数
        // 商户订单号
        String outTradeNo = params.get("out_trade_no");
        //交易状态
        String tradeStatus = params.get("trade_status");
        System.out.println("outTradeNo:" + outTradeNo + " tradeStatus:" + tradeStatus);
        //3.签名验证(对支付宝返回的数据验证，确定是支付宝返回的)
        boolean signVerified = false;
        try {
            //3.1调用SDK验证签名
            signVerified = AlipaySignature.rsaCheckV1(params, alipay.publicKey, alipay.charset, alipay.signType);

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("--------------->验签结果:" + signVerified);
        //4.对验签进行处理
        if (signVerified) {
            //验签通过
            //只处理支付成功的订单: 修改交易表状态,支付成功
            if ("TRADE_FINISHED".equals(tradeStatus) || "TRADE_SUCCESS".equals(tradeStatus)) {
                OrderApi.paySuccess(outTradeNo);
                return "success";
            } else {
                return "failure";
            }
        } else {
            //验签不通过
            System.err.println("-------------------->验签失败");
            return "failure";
        }
    }

}
