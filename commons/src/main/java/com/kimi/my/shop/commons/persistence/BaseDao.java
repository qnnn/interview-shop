package com.kimi.my.shop.commons.persistence;

import java.util.List;
import java.util.Map;

/**
 *功能描述：<br>
 *(所有数据访问层)
 *Author:郭富城
 *Date:2020/8/29 21:52
*/
public interface BaseDao <T extends BaseEntity> {
    /**
     *功能描述：<br>
     *(查询用户表全部信息)
     *@Param:[]
     *@Return:java.util.List<com.kimi.my.shop.domain.TbUser>
     *@Author:郭富城
     *@Date:2020/8/113:54
     */
    List<T> selectAll();

    /**
     *功能描述：<br>
     *(新增)
     *@Param:
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/213:32
     */
    void insert(T entity);

    /**
     *功能描述：<br>
     *(删除)
     *@Param:[long]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/214:46
     */
    void delete(Long id);

    /**
     *功能描述：<br>
     *(根据id查询用户信息)
     *@Param:[id]
     *@Return:com.kimi.my.shop.domain.TbUser
     *@Author:郭富城
     *@Date:2020/8/214:57
     */
    T getById(Long id);

    /**
     *功能描述：<br>
     *(更新)
     *@Param:[tbUser]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/1213:22
     */
    void update(T tbUser);


    /**
     *功能描述：<br>
     *(批量删除)
     *@Param:[ids]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/1017:15
     */
    void deleteMulti(String[] ids);

    /**
     *功能描述：<br>
     *(需要两个参数，start/记录数据开始的位置，length/记录长度)
     *@Param:[params]
     *@Return:java.util.List<com.kimi.my.shop.domain.TbUser>
     *@Author:郭富城
     *@Date:2020/8/1018:58
     */
    List<T> page(Map<String,Object> params);

    /**
     *功能描述：<br>
     *(查询总笔数)
     *@Param:[]
     *@Return:int
     *@Author:郭富城
     *@Date:2020/8/1019:54
     */
    int count(T tbUser);
}
