package com.action;

import com.dao.VipDAO;
import com.pojo.Vip;
import com.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VipAction {
    @Autowired
    private VipService service;

    @RequestMapping("/test")
    public ModelAndView testFindByvipid(){
        String Vipmsg=service.getVip();
        ModelAndView mav=new ModelAndView();
        mav.addObject("Vipmsg",Vipmsg);
        mav.setViewName("vip_list.jsp");
        return mav;
    }





}
