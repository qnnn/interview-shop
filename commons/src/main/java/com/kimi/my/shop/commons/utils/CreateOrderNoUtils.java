package com.kimi.my.shop.commons.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @ClassName CreateOrderNoUtils
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/9 17:55
 * @Version 1.0
 **/
public class CreateOrderNoUtils {

    public static String getOrderNo() {
        Random rd = new Random();
        String n = "";
        int rdGet;
        do {
            if (rd.nextInt() % 2 == 1) {
                // 产生48到57的随机数(0-9的键位值)
                rdGet = Math.abs(rd.nextInt()) % 10 + 48;
            }else{
                // 产生97到122的随机数(a-z的键位值)
                rdGet = Math.abs(rd.nextInt()) % 26 + 97;
            }
            //int转换char
            char num1 = (char) rdGet;
            String dd = Character.toString(num1);
            n += dd;

        } while (n.length() < 3);
        String r1= (((Math.random()*9+1)*100000)+"").substring(0, 3);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String SNDate = sdf.format(new Date());
        String orderCode = SNDate + n.toUpperCase() + r1;
        return orderCode;
    }

}
