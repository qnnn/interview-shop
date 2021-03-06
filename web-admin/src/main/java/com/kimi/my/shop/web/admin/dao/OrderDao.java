package com.kimi.my.shop.web.admin.dao;

import com.kimi.my.shop.commons.persistence.BaseDao;
import com.kimi.my.shop.domain.Order;
import com.kimi.my.shop.domain.TbUser;
import org.springframework.stereotype.Repository;

/**
 * @author 郭富城
 */
@Repository
public interface OrderDao extends BaseDao<Order> {
    /**
     * 通过用户ID查找订单
     * @param id
     * @return
     */

}
