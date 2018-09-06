package com.agesun.mybatis.controller;
import javax.servlet.http.HttpServletRequest;
import com.agesun.mybatis.bean.FileEntity;
import com.agesun.mybatis.util2.FileUploadTool;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
/*@RequestMapping("/uploadflv")*/
public class UploadController {

    @RequestMapping("/uploadjsp")
    public String  jspupload(){
        return "upload";

    }

    @RequestMapping(value = "/upload", method={RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public ModelAndView upload(@RequestParam(value = "file", required = false) MultipartFile[] multipartFile,
                               HttpServletRequest request, ModelMap map) {
        String message = "";
        FileEntity entity = new FileEntity();
        FileUploadTool fileUploadTool = new FileUploadTool();
        ModelAndView mv=new ModelAndView("upload");


        //判断file数组不能为空并且长度大于0
        if (multipartFile!= null && multipartFile.length > 0) {
            //循环获取file数组中得文件
            for (int i = 0; i < multipartFile.length; i++) {
                MultipartFile file = multipartFile[i];

                try {
                    entity = fileUploadTool.createFile(file, request);
                    if (entity != null) {
                        //                service.saveFile(entity);
                        message = "上传成功";
                        map.put("entity", entity);
                        map.put("result", message);
                    } else {
                        message = "上传失败";
                        map.put("result", message);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }

       /* mv.addObject("result", map);*/
        mv.addObject("result", message);
        return mv;
    }

}
