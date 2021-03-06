package com.kimi.my.shop.web.api.service.Impl;

import com.kimi.my.shop.domain.Cart;
import com.kimi.my.shop.domain.Order;
import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.ReceivingInfo;
import com.kimi.my.shop.web.api.dao.CartDao;
import com.kimi.my.shop.web.api.dao.OrderDao;
import com.kimi.my.shop.web.api.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * @ClassName OrderServiceImpl
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/9 15:35
 * @Version 1.0
 **/
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;
    @Autowired
    CartDao cartDao;

    public OrderServiceImpl(OrderDao orderDao, CartDao cartDao) {
        this.orderDao = orderDao;
        this.cartDao = cartDao;
    }

    @Override
    public List<Order> showOrderList(Long userId, int status) {
        return orderDao.showOrderList(userId, status);
    }

    @Override
    public List<Order> showOrderListByOrderNo(Long userId, String orderNo, int status) {
        return orderDao.showOrderListByOrderNoAndUserId(userId, orderNo, status);
    }

    @Override
    public List<String> findOrderNo(Long userId, int status) {
        return orderDao.findOrderNo(userId, status);
    }

    @Override
    public void submitOrder(Long userId, String orderNo) {
        //查找收货信息中是否存在用户
        ReceivingInfo receivingInfo = orderDao.findUserInReceivingInfo(userId);
        if(receivingInfo == null){
            orderDao.addReceivingInfo(userId);
        }
        //取出收货信息id
        receivingInfo = orderDao.findUserInReceivingInfo(userId);

        //查找购物车中已选择的商品
        List<Cart> cartList = cartDao.showCartListByStatus(userId, 1);
        cartDao.deleteCartBySelect(userId, 1);
        for(Cart cart : cartList){
            Order order = new Order();
            Product product = new Product();
            product.setId(cart.getProductId());
            BigDecimal bdNum = new BigDecimal(cart.getNumber());
            BigDecimal totalPrice = cart.getProduct().getPrice().multiply(bdNum);
            order.setOrderNo(orderNo);
            order.setProduct(product);
            order.setTotalPrice(totalPrice);
            order.setNumber(cart.getNumber());
            order.setReceivingInfo(receivingInfo);
            order.setPayMethod("支付宝");
            order.setStatus(1);
            orderDao.submitOrder(order);
        }
    }

    @Override
    public int deleteOrder(Long userId, String orderNo) {
        //查找用户收货信息
        ReceivingInfo receivingInfo = orderDao.findUserInReceivingInfo(userId);
        //删除订单-验证是同一用户
        return orderDao.deleteOrder(orderNo, receivingInfo.getId());
    }

    @Override
    public int payOrder(ReceivingInfo receivingInfo, String orderNo) {
        //更新用户收货信息
        return orderDao.updateReceivingInfo(receivingInfo);
    }

    @Override
    public int paySuccess(String orderNo) {
        //更新商品已售数量
//        List<Order> orderList = orderDao.showOrderListByOrderNo(orderNo);
//        for(Order order : orderList){
//            Long productId = order.getProduct().getId();
//            int number = order.getNumber();
//            orderDao.updateSoldNum(productId, number);
//            orderDao.updateStockNum(productId, number);
//        }
        //支付状态改变
        Order order = new Order();
        order.setOrderNo(orderNo);
        //状态2-已支付，待发货
        order.setStatus(2);
        return orderDao.updateStatusByOrderNo(order);
    }

    @Override
    public int confirmReceipt(String orderNo){
        Order order = new Order();
        order.setOrderNo(orderNo);
        //状态4-收货，订单结束
        order.setStatus(4);
        return orderDao.updateStatusByOrderNo(order);
    }

}
