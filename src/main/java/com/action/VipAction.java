package com.action;

import com.alibaba.fastjson.JSONObject;
import com.pojo.Vip;
import com.service.VipService;
import com.util.UUIDTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.misc.Request;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class VipAction {
    @Autowired
    private VipService service;

    @RequestMapping(value = "/findbyid",produces = "text/html;charset=utf-8")
    //@responsebody用来将返回值解析成json数据 不使用则返回一个跳转路径

    public @ResponseBody String testFindBuvipid(){
        String Vipmsg=service.getVip();
        int count = service.count();
        String json ="{\"code\":0, \"msg\":\"\", \"count\":"+count+",\"data\":"+Vipmsg+"}" ;
//        String json ="{\"code\":0, \"msg\":\"\", \"count\":1000,\"data\":"+Vipmsg+"}" ;
        System.out.println(json);
        return json;
    }

    @RequestMapping("/add")
    public  String addvip(){
        String vip_id = UUIDTool.getUUID();
        String vip_tel = "13973738888";
        service.addVip(vip_id,vip_tel);
        return "background.jsp";
    }

    @RequestMapping("/addopenid")
    public String addvipbyopenid(){
        int openid = 111;
        String vip_id = UUIDTool.getUUID();
        service.addVipbyopenid(openid,vip_id);
        return "background.jsp";
    }

    @RequestMapping("/updateMsg")
    @ResponseBody
    public int updateMsg(String vip_id,String vip_name,String vip_IDcard,String vip_tel){
        System.out.println(vip_id);
        System.out.println(vip_name);

        int x = service.updateMsg(vip_id,vip_name,vip_IDcard,vip_tel);
        return x;
    }

    @ResponseBody
    @RequestMapping(value="/delete")
    public  int  delete( String vip_id ){
        int num=0;
        if (vip_id!= null) {
            num = service.deleteMsg(vip_id);
        }
        System.out.println(vip_id);
        return num;

    }



}
