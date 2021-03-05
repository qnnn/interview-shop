package com.kimi.my.shop.commons.persistence;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;

import java.util.List;

public interface BaseService<T extends BaseEntity> {
    /**
     *功能描述：<br>
     *(查询全部)
     *@Param:[]
     *@Return:java.util.List<com.kimi.my.shop.domain.TbUser>
     *@Author:郭富城
     *@Date:2020/8/1213:22
     */
    List<T> selectAll();

    //储存用户信息
    BaseResult save(T entity);

    //删除用户信息
    void delete(Long id);

    /**
     *功能描述：<br>
     *(通过id查找)
     *@Param:[id]
     *@Return:com.kimi.my.shop.domain.TbUser
     *@Author:郭富城
     *@Date:2020/8/1213:25
     */
    T getById(Long id);

    /**
     *功能描述：<br>
     *(更新)
     *@Param:[tbUser]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/1213:25
     */
    void update(T entity);

    /**
     *功能描述：<br>
     *(批量删除)
     *@Param:[ids]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/1017:16
     */
    void deleteMulti(String[] ids);

    /**
     *功能描述：<br>
     *(分页查询)
     *@Param:[start, length]
     *@Return:java.util.List<com.kimi.my.shop.domain.TbUser>
     *@Author:郭富城
     *@Date:2020/8/1018:59
     */
    PageInfo<T> page(int start, int length, int draw, T entity);

    /**
     *功能描述：<br>
     *(查询总笔数)
     *@Param:[]
     *@Return:int
     *@Author:郭富城
     *@Date:2020/8/1019:54
     */
    int count(T entity);
}
