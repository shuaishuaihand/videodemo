package com.agesun.mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UploadProgressController {

    @RequestMapping("/uploadprojsp")
    public String  jspupload(){
        return "uploadProgress";

    }

    @RequestMapping("/window")
    public String  window(){
        return "window";

    }

    @RequestMapping("/waterfall")
    public String  waterfal(){
        return "advfall";

    }
}
