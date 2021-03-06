package com.kimi.my.shop.web.api.service.Impl;

import com.kimi.my.shop.domain.Cart;
import com.kimi.my.shop.web.api.dao.CartDao;
import com.kimi.my.shop.web.api.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CartServiceImpl
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 21:59
 * @Version 1.0
 **/
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;

    public CartServiceImpl(CartDao cartDao) {
        this.cartDao = cartDao;
    }
//    private final CartDao cartDao;
//
//    public CartServiceImpl(CartDao cartDao) {
//        this.cartDao = cartDao;
//    }

    @Override
    public List<Cart> showCartList(Long userId) {
        return cartDao.showCartList(userId);
    }

    @Override
    public int addCart(Cart cart) {
        Cart cart1 = cartDao.isExistCart(cart);
        if(cart1 != null){
            return cartDao.addNum(cart1.getId());
        }
        return cartDao.addCart(cart);
    }

    @Override
    public int deleteCart(Long id) {
        return cartDao.deleteCart(id);
    }

    @Override
    public int addNum(Long id) {
        return cartDao.addNum(id);
    }

    @Override
    public int subNum(Long id) {
        return cartDao.subNum(id);
    }

    @Override
    public int updateOneFlag(Long id){
        Cart cart = cartDao.selectCartById(id);
        if(cart.getFlag() == 1){
            return cartDao.updateOneFlag(id, 0);
        }else{
            return cartDao.updateOneFlag(id, 1);
        }

    }

    @Override
    public int updateAllFlag(Long userId){
        List<Cart> cartList =  cartDao.showCartList(userId);
        boolean isSelectAll = true;
        for(Cart cart : cartList){
            if(cart.getFlag() == 0){
                isSelectAll = false;
            }
        }
        if(isSelectAll){
            return cartDao.updateAllFlag(userId, 0);
        }else{
            return cartDao.updateAllFlag(userId, 1);
        }

    }
}
