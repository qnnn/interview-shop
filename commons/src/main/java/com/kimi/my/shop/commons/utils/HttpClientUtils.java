package com.kimi.my.shop.commons.utils;

import org.apache.http.HttpEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;

public class HttpClientUtils {
    public static final String GET = "get";
    public static final String POST = "post";

    //设置长连接
    public static final String REQUEST_HEADER_CONNECTION = "keep-alive";
    //设置代理（模拟浏览器版本）
    public static final String REQUEST_HEADER_USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36";


    /*
     *功能描述：<br>
     *(Get请求)
     *@Param:[url]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/9/1412:02
    */
    public static String doGet(String url){
        return createRequest(url,GET,null);
    }

    /*
     *功能描述：<br>
     *(get)
     *@Param:[url, cookie]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/9/1412:03
    */
    public static String doGet(String url,String cookie){
        return createRequest(url,GET,cookie);
    }

    /*
     *功能描述：<br>
     *(POST请求)
     *@Param:[url, params]params可选
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/9/1412:02
    */
    public static String doPost(String url,BasicNameValuePair... params){
        return createRequest(url,POST,null,params);
    }

    /*
     *功能描述：<br>
     *(POST请求)
     *@Param:[url, cookie, params]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/9/1412:04
    */
    public static String doPost(String url,String cookie ,BasicNameValuePair... params){
        return createRequest(url,POST,cookie,params);
    }

    /**
     *功能描述：<br>
     *(创建请求)
     *@Param:[url, requestMethod, cookies, params]请求地址、方式、cookies、请求参数
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/9/1411:58
    */
    private static String createRequest(String url, String requestMethod,String cookie, BasicNameValuePair... params){
        CloseableHttpClient httpClient = HttpClients.createDefault();

        //请求结果
        String result = null;

        //请求方式
        HttpGet httpGet = null;
        HttpPost httpPost = null;

        //响应
        CloseableHttpResponse httpResponse = null;

        //GET请求
        if (GET.equals(requestMethod)){
            httpGet = new HttpGet(url);
            // 设置长连接
            httpGet.setHeader("Connection", REQUEST_HEADER_CONNECTION);
            // 设置代理（模拟浏览器版本）
            httpGet.setHeader("User-Agent", REQUEST_HEADER_USER_AGENT);
            // 设置 Cookie
            httpGet.setHeader("Cookie", cookie);

            try {
                httpResponse = httpClient.execute(httpGet);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //POST请求
        else if (POST.equals(requestMethod)){
            httpPost = new HttpPost(url);
            // 设置长连接
            httpPost.setHeader("Connection", REQUEST_HEADER_CONNECTION);
            // 设置代理（模拟浏览器版本）
            httpPost.setHeader("User-Agent", REQUEST_HEADER_USER_AGENT);
            // 设置 Cookie
            httpPost.setHeader("Cookie",cookie);

            if(params != null && params.length>0){
                try {
                    httpPost.setEntity(new UrlEncodedFormEntity(Arrays.asList(params),"UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }

            try {
                httpResponse = httpClient.execute(httpPost);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        HttpEntity httpEntity = httpResponse.getEntity();

        try {
            result = EntityUtils.toString(httpEntity);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}


















