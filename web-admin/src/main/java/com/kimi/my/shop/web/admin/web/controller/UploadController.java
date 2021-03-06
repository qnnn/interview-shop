package com.kimi.my.shop.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.Filter;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 *功能描述：<br>
 *(文件上传控制器)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/8/2414:56
 */
@Controller
public class UploadController {

    private static final String UPLOAD_PATH= "/static/upload/";

    /**
     *功能描述：<br>
     *(
     * dropFile : Dropzone
     * editorFile : wangEditor
     * )
     *@Param:[dropFile, editorFile, request]
     *@Return:java.util.Map<java.lang.String,java.lang.Object>
     *@Author:郭富城
     *@Date:2020/8/2520:00
     */
    @ResponseBody
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public Map<String,Object> upload(MultipartFile dropFile, MultipartFile[] editorFiles, HttpServletRequest request){
        Map<String,Object> result = new HashMap<>();

//        MultipartFile myFile=dropFile==null? editorFile:dropFile;

        //DropZone 上传
        if(dropFile != null) {
            result.put("fileName",writeFile(dropFile,request));
        }

        //wangEditor上传
        if(editorFiles!=null & editorFiles.length > 0) {
            /**
             *功能描述：<br>
             *(
             * scheme:服务端提供的协议 http|https
             * serverName:服务器名称 localhost|ip|domain
             * serverPort:服务器端口
             * )
             *@Param:[dropFile, request]
             *@Return:java.util.Map<java.lang.String,java.lang.Object>
             *@Author:郭富城
             *@Date:2020/8/2519:51
             */
            List<String> fileNames = new ArrayList<>();

            for(MultipartFile editorFile : editorFiles){
                fileNames.add(writeFile(editorFile,request));
            }
            result.put("errno", 0);
            result.put("data", fileNames);
        }
        return result;
    }

    private String writeFile(MultipartFile multipartFile,HttpServletRequest request){
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix=fileName.substring(fileName.lastIndexOf("."));
        String filePath = "D:\\IDEA2020Code\\route\\my-shop\\static\\upload\\";
        File file = new File(filePath);
        //判断路径是否存在，不存在则创建文件
        if (!file.exists()){
            file.mkdir();
        }

        //将文件写入目标文件
        file= new File(filePath, UUID.randomUUID()+fileSuffix);
        try {
            multipartFile.transferTo(file.getAbsoluteFile());
        } catch (IOException e) {
            e.printStackTrace();
        }

        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        return file.getName();
    }
}