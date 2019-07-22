package com.action;

import com.dao.VipDAO;
import com.pojo.Vip;
import com.service.VipService;
import com.util.UUIDTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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




}
