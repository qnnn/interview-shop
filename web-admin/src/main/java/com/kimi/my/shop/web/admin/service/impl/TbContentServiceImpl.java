package com.kimi.my.shop.web.admin.service.impl;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.commons.validator.BeanValidator;
import com.kimi.my.shop.domain.TbContent;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseServiceImpl;
import com.kimi.my.shop.web.admin.dao.TbContentDao;
import com.kimi.my.shop.web.admin.service.TbContentService;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TbContentServiceImpl extends AbstractBaseServiceImpl<TbContent,TbContentDao> implements TbContentService {


/**
 *功能描述：<br>
 *(验证【已改为注解】)
 *@Param:[tbContent]
 *@Return:com.kimi.my.shop.commons.dto.BaseResult
 *@Author:郭富城
 *@Date:2020/9/122:49
*/
//    private BaseResult checkTbContent(TbContent tbContent){
//        BaseResult baseResult = BaseResult.success();
//
//        //非空验证
//        if(tbContent.getCategoryId()==null){
//            baseResult = BaseResult.fail("内容所属分类不能为空，请重新输出");
//        }
//
//
//        else if(StringUtils.isBlank(tbContent.getPassword())){
//            baseResult = BaseResult.fail("密码不能为空，请重新输入");
//        }
//
//        else if(StringUtils.isBlank(tbContent.getUsername())){
//            baseResult = BaseResult.fail("姓名不能为空，请重新输入");
//        }
//
//        else if(StringUtils.isBlank(tbContent.getPhone())){
//            baseResult = BaseResult.fail("手机不能为空，请重新输入");
//        }
//
//
//        return  baseResult;
//    }

    @Override
    public BaseResult save(TbContent tbContent) {
        Map<String, String> map = BeanValidator.validate(tbContent);
        if (MapUtils.isNotEmpty(map)) {
            StringBuilder Msg=new StringBuilder();
            Msg.append("格式错误！请勿绕过前端验证！<br/>");
            for (Map.Entry<String, String> entry : map.entrySet()) {
                Msg.append(String.format("%s",entry.getValue())).append(map.size()>1?"<br/>":"");
            }
            return BaseResult.fail(Msg.toString());
        }
        else {
            tbContent.setUpdated(new Date());

            //新增
            if (tbContent.getId() == null) {
                tbContent.setCreated(new Date());
                dao.insert(tbContent);
            }

            //编辑用户
            else {
                update(tbContent);
            }

            return BaseResult.success("保存内容信息成功");
        }
    }
}
