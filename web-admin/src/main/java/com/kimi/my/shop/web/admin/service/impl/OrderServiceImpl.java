package com.kimi.my.shop.web.admin.service.impl;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.validator.BeanValidator;
import com.kimi.my.shop.domain.Order;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseServiceImpl;
import com.kimi.my.shop.web.admin.dao.OrderDao;
import com.kimi.my.shop.web.admin.service.OrderService;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * @author 郭富城
 */
@Service
public class OrderServiceImpl extends AbstractBaseServiceImpl<Order, OrderDao> implements OrderService {
    @Autowired
    OrderDao orderDao;


    @Override
    public BaseResult save(Order entity) {
        Map<String ,String >map = BeanValidator.validate(entity);
        if (MapUtils.isNotEmpty(map)){
            StringBuilder builder = new StringBuilder();
            builder.append("格式错误！请勿绕过前端验证！<br/>");
            for (Map.Entry<String ,String> entry:map.entrySet()){
                builder.append(String.format("%s",entry.getValue())).append(map.size()>1?"<br/>":"");
            }
            return BaseResult.fail(builder.toString());
        }
        else{
            // 没有订单号
            if (entity.getOrderNo() == null){
                return BaseResult.fail("非法操作！订单号不能为空！");
            }
            else {
                entity.setUpdated(new Date());
                // 运输中
                entity.setStatus(3);
                update(entity);
            }
        }
        return BaseResult.success("更新订单信息成功");
    }
}
