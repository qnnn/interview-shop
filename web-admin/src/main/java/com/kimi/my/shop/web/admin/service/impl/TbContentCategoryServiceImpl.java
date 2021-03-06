package com.kimi.my.shop.web.admin.service.impl;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.commons.validator.BeanValidator;
import com.kimi.my.shop.domain.TbContentCategory;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseTreeServiceImpl;
import com.kimi.my.shop.web.admin.dao.TbContentCategoryDao;
import com.kimi.my.shop.web.admin.service.TbContentCategoryService;
import lombok.extern.log4j.Log4j;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Log4j
@Service
@Transactional(readOnly = true)
public class TbContentCategoryServiceImpl extends AbstractBaseTreeServiceImpl<TbContentCategory,TbContentCategoryDao> implements TbContentCategoryService {

    @Override
    @Transactional
    public BaseResult save(TbContentCategory entity) {
        Map<String, String> map = BeanValidator.validate(entity);
        if (MapUtils.isNotEmpty(map)) {
            StringBuilder Msg = new StringBuilder();
            Msg.append("格式错误！请勿绕过前端验证！<br/>");
            for (Map.Entry<String, String> entry : map.entrySet()) {
                Msg.append(String.format("%s", entry.getValue())).append(map.size() > 1 ? "<br/>" : "");
            }
            return BaseResult.fail(Msg.toString());
        } else {
            //得到他爹
            TbContentCategory parent = entity.getParent();
            //若无选择父级节点则默认选择为根目录
            if (parent == null || parent.getId() == null) {
                //0为根目录
                parent.setId(0L);
            }
            entity.setUpdated(new Date());
            //新增
            if (entity.getId() == null) {
                entity.setCreated(new Date());
                entity.setIsParent(false);
                //判断当前节点是否为父节点
                if (parent.getId() != 0L) {
                    TbContentCategory currentCategoryParent = getById(parent.getId());
                    if (currentCategoryParent != null) {
                        //为父级节点设置 isParent 为true
                        currentCategoryParent.setIsParent(true);
                        update(currentCategoryParent);
                    }
                }
                //父级节点为0，表示为根目录
                else {
                    //根目录一定是父级类目
                    entity.setIsParent(true);
                }
                dao.insert(entity);
            }
            //修改
            else {
                update(entity);
            }
            return BaseResult.success("保存内容信息成功");
        }
    }
}
