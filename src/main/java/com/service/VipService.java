package com.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.VipDAO;
import com.pojo.Vip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipService {
    @Autowired
    private VipDAO vipDAO ;

    public String getVip(){
//        String vipid = "11111111111111111111111111111111";
        List list = vipDAO.findAll();
        String jsonString= JSONArray.toJSONString(list);
        System.out.println(jsonString);
        String jsonString1 ="{\"code\":0, \"msg\":\"\", \"count\":1000, \"data\":"+jsonString+"}" ;
        System.out.println(jsonString1);
        return jsonString1;
    }
}
