package com.kimi.my.shop.web.admin.service.impl;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.validator.BeanValidator;
import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.TbContent;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseServiceImpl;
import com.kimi.my.shop.web.admin.dao.ProductDao;
import com.kimi.my.shop.web.admin.service.ProductService;
import org.apache.commons.collections4.MapUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * @author 郭富城
 */
@Service
public class ProductServiceImpl extends AbstractBaseServiceImpl<Product, ProductDao> implements ProductService {
    @Override
    public BaseResult save(Product entity) {
        Map<String, String> map = BeanValidator.validate(entity);
        if (MapUtils.isNotEmpty(map)) {
            StringBuilder Msg=new StringBuilder();
            Msg.append("格式错误！请勿绕过前端验证！<br/>");
            for (Map.Entry<String, String> entry : map.entrySet()) {
                Msg.append(String.format("%s",entry.getValue())).append(map.size()>1?"<br/>":"");
            }
            return BaseResult.fail(Msg.toString());
        }
        else {

            entity.setUpdated(new Date());

            // 新增
            if (entity.getId() == null) {
                entity.setSoldNum(0);
                dao.insert(entity);
            }

            // 编辑用户
            else {
                update(entity);
            }

            return BaseResult.success("保存内容信息成功");
        }
    }
}
