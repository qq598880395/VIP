package com.action;

import com.dao.VipDAO;
import com.pojo.Vip;
import com.service.VipService;
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
    public @ResponseBody String testFindBuvipid(){
        String Vipmsg=service.getVip();
//        int count = service.count();
//        String json ="{\"code\":0, \"msg\":\"\", \"count\":"+count+",\"data\":"+Vipmsg+"}" ;
        String json ="{\"code\":0, \"msg\":\"\", \"count\":1000,\"data\":"+Vipmsg+"}" ;
        System.out.println(json);
        return json;
    }






}
