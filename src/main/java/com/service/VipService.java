package com.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.VipDAO;
import com.pojo.Vip;
import javafx.scene.control.Alert;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipService {
    @Autowired
    private VipDAO vipDAO ;

    public String getVip(){
        List list = vipDAO.findAll();
        String jsonString= JSONArray.toJSONString(list);
        System.out.println(jsonString);
        return jsonString;
    }
    public int count(){
        int x = vipDAO.count();
        return  x;
    }
    public int addVip(String id,String tel){
        vipDAO.addVipBytel(id,tel);
        int x = 1;
        return x;
    }
    public int addVipbyopenid(int openid,String vip_id){
        vipDAO.addVipByopenid(openid,vip_id);
        int x = 1;
        return x;
    }
}
